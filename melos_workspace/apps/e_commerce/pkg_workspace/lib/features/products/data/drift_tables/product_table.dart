import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_variant_table.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
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
    final variantGroupsRowData = await (db.select(db.productVariantGroupTable)
          ..where((tbl) => tbl.productId.equals(data.id)))
        .get();

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
      variantGroups: await Future.wait(
        variantGroupsRowData.map((e) => ProductVariantGroup.fromDbData(db, e)),
      ),
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

@DriftAccessor(tables: [ProductTable])
class ProductTableDao extends DatabaseAccessor<AppDatabase>
    with _$ProductTableDaoMixin {
  ProductTableDao(super.db);

  Future<void> addProductFromOrderItem(
    OrderItem item, {
    bool replaceOld = false,
  }) async {
    await db.transaction(() async {
      final productTableData = await db.into(db.productTable).insertReturning(
            item.product.toDbCompanion(),
            mode: replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
          );

      for (final group in item.product.variantGroups) {
        final groupTableData = await db
            .into(db.productVariantGroupTable)
            .insertReturning(
              group.toDbCompanion(productId: productTableData.id),
              mode: replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
            );

        for (final variant in group.variants) {
          await db.into(db.productVariantTable).insert(
                variant.toDbCompanion(groupId: groupTableData.id),
                mode:
                    replaceOld ? InsertMode.insertOrReplace : InsertMode.insert,
              );
        }
      }
    });
  }

  Future<ProductTableData?> getProduct(int productId) async {
    return (select(db.productTable)..where((tbl) => tbl.id.equals(productId)))
        .getSingleOrNull();
  }

  Future<ProductTableData?> getProductByVariantId(DatabaseKey variantId) async {
    final query = select(db.productTable).join([
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.productId.equalsExp(db.productTable.id),
      ),
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.groupId
            .equalsExp(db.productVariantGroupTable.id),
      ),
    ])
      ..where(
        db.productVariantTable.id.equals(variantId),
      );

    final result = await query.getSingleOrNull();
    return result?.readTable(db.productTable);
  }
}
