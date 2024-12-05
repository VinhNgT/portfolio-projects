import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'product_table.g.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  RealColumn get discountPercentage => real()();
  RealColumn get rating => real()();
  IntColumn get stock => integer()();
  TextColumn get tags => text().map(const DbJsonConverter())();
  TextColumn get brand => text().nullable()();
  TextColumn get sku => text()();
  IntColumn get weight => integer()();
  TextColumn get dimensions => text().map(const DbJsonConverter())();
  TextColumn get warrantyInformation => text()();
  TextColumn get shippingInformation => text()();
  TextColumn get availabilityStatus => text()();
  TextColumn get reviews => text().map(const DbJsonConverter())();
  TextColumn get returnPolicy => text()();
  IntColumn get minimumOrderQuantity => integer()();
  TextColumn get meta => text().map(const DbJsonConverter())();
  TextColumn get thumbnail => text()();
  TextColumn get images => text().map(const DbJsonConverter())();
}

extension ProductTableDomainConverter on Product {
  static Future<Product> fromDbData(
    AppDatabase db,
    ProductTableData data,
  ) async {
    final variantGroups = await db.productVariantGroupTableDao
        .getProductVariantGroupForProduct(data.id);

    return Product(
      id: data.id,
      title: data.title,
      description: data.description,
      category: data.category,
      price: data.price,
      discountPercentage: data.discountPercentage,
      rating: data.rating,
      stock: data.stock,
      tags: (data.tags as List).cast<String>(),
      brand: data.brand,
      sku: data.sku,
      weight: data.weight,
      dimensions: ProductDimensions.fromJson(data.dimensions),
      warrantyInformation: data.warrantyInformation,
      shippingInformation: data.shippingInformation,
      availabilityStatus: data.availabilityStatus,
      reviews: (data.reviews as List)
          .cast<Map<String, dynamic>>()
          .map(ProductReview.fromJson)
          .toList(),
      returnPolicy: data.returnPolicy,
      minimumOrderQuantity: data.minimumOrderQuantity,
      meta: ProductMeta.fromJson(data.meta),
      thumbnail: data.thumbnail,
      images: (data.images as List).cast<String>(),
      variantGroups: variantGroups,
    );
  }

  ProductTableCompanion toDbCompanion() {
    return ProductTableCompanion(
      id: Value.absentIfNull(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      price: Value(price),
      discountPercentage: Value(discountPercentage),
      rating: Value(rating),
      stock: Value(stock),
      tags: Value(tags),
      brand: Value(brand),
      sku: Value(sku),
      weight: Value(weight),
      dimensions: Value(dimensions.toJson()),
      warrantyInformation: Value(warrantyInformation),
      shippingInformation: Value(shippingInformation),
      availabilityStatus: Value(availabilityStatus),
      reviews: Value(reviews.map((e) => e.toJson()).toList()),
      returnPolicy: Value(returnPolicy),
      minimumOrderQuantity: Value(minimumOrderQuantity),
      meta: Value(meta.toJson()),
      thumbnail: Value(thumbnail),
      images: Value(images),
    );
  }
}

@DriftAccessor()
class ProductTableDao extends DatabaseAccessor<AppDatabase> {
  ProductTableDao(super.db);

  Future<DatabaseKey> addProduct({required Product product}) {
    return db.transaction(() async {
      final dbProductData =
          await into(db.productTable).insertReturning(product.toDbCompanion());

      for (final group in product.variantGroups) {
        await db.productVariantGroupTableDao.addProductVariantGroup(
          productVariantGroup: group,
          productId: dbProductData.id,
        );
      }

      return dbProductData.id;
    });
  }

  Future<Product?> getProduct(DatabaseKey productId) async {
    final dbProduct = await (select(db.productTable)
          ..where((tbl) => tbl.id.equals(productId)))
        .getSingleOrNull();

    return dbProduct != null ? Product.fromDbData(db, dbProduct) : null;
  }

  Future<Product?> getProductFromOrderItem(DatabaseKey orderItemId) async {
    final query = db.select(db.productTable, distinct: true).join([
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.productId.equalsExp(db.productTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.groupId
            .equalsExp(db.productVariantGroupTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.orderItemVariantSelectionTable,
        db.orderItemVariantSelectionTable.variantId
            .equalsExp(db.productVariantTable.id),
        useColumns: false,
      ),
      innerJoin(
        db.orderItemTable,
        db.orderItemTable.id
            .equalsExp(db.orderItemVariantSelectionTable.orderItemId),
        useColumns: false,
      ),
    ])
      ..where(db.orderItemTable.id.equals(orderItemId));

    final result = await query
        .map((row) => row.readTable(db.productTable))
        .getSingleOrNull();

    return result != null ? Product.fromDbData(db, result) : null;
  }

  Future<void> removeProduct(DatabaseKey productId) async {
    await db.transaction(() async {
      await (delete(db.productTable)..where((tbl) => tbl.id.equals(productId)))
          .go();
    });
  }

  Future<bool> checkProductExists({required DatabaseKey productId}) async {
    final productExistsStm = db.selectOnly(db.productTable)
      ..addColumns([db.productTable.id])
      ..where(db.productTable.id.equals(productId));

    final productExists = await productExistsStm.getSingleOrNull() != null;
    return productExists;
  }

  Future<bool> checkIfProductIsInCart(
    DatabaseKey productId,
    DatabaseKey cartId,
  ) async {
    final countExp = db.productTable.id.count(distinct: true);

    final query = selectOnly(db.productTable).join([
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.productId.equalsExp(db.productTable.id),
      ),
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.groupId
            .equalsExp(db.productVariantGroupTable.id),
      ),
      innerJoin(
        db.orderItemVariantSelectionTable,
        db.orderItemVariantSelectionTable.variantId
            .equalsExp(db.productVariantTable.id),
      ),
      innerJoin(
        db.orderItemTable,
        db.orderItemTable.id
            .equalsExp(db.orderItemVariantSelectionTable.orderItemId),
      ),
      innerJoin(
        db.cartItemTable,
        db.cartItemTable.orderItemId.equalsExp(db.orderItemTable.id),
      ),
      innerJoin(
        db.cartTable,
        db.cartTable.id.equalsExp(db.cartItemTable.cartId),
      ),
    ])
      ..where(
        db.productTable.id.equals(productId) & db.cartTable.id.equals(cartId),
      )
      ..addColumns([countExp])
      ..groupBy([db.productTable.id]);

    // Group by if run on an empty result will return blank instead of 0.
    final result =
        await query.map((row) => row.read(countExp)).getSingleOrNull() ?? 0;
    return result > 0;
  }
}
