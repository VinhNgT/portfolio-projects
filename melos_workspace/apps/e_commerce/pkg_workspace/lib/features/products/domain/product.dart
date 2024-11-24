import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/typedefs.dart';
import 'package:intl/intl.dart';

part 'product.mapper.dart';

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

extension ProductTableDataConverter on Product {
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

@MappableClass()
class Product with ProductMappable {
  final int? id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final String sku;
  final int weight;
  final ProductDimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductReview> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMeta meta;
  final String thumbnail;
  final List<String> images;
  final List<ProductVariantGroup> variantGroups;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.thumbnail,
    required this.images,
    required this.variantGroups,
  });

  @MappableConstructor()
  Product.mock({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.thumbnail,
    required this.images,
  }) : variantGroups = prototype.variantGroups;

  static const fromDbData = ProductTableDataConverter.fromDbData;

  factory Product.fromJson(Map<String, dynamic> json) =>
      ProductMapper.fromJson(json);

  static Product get prototype => _ProductPrototypeX._prototype;
}

extension ProductMethods on Product {
  /// Check if all of the [variantSelection] are present in the
  /// [variantGroups].
  bool checkVariantSelectionValid(List<ProductVariant> variantSelection) {
    final Map<DatabaseKey, bool> variantSelectionValidMap = {
      for (final variant in variantSelection) variant.id!: false,
    };

    for (final group in variantGroups) {
      for (final variant in group.variants) {
        if (variantSelectionValidMap.containsKey(variant.id)) {
          variantSelectionValidMap[variant.id!] = true;
        }
      }
    }

    return variantSelectionValidMap.values.every((e) => e);
  }
}

extension ProductPriceX on Product {
  NumberFormat get vndPriceFormatter => NumberFormat.currency(
        locale: 'vi_VN',
        symbol: '₫',
        decimalDigits: 0,
        customPattern: '¤#,###',
      );

  // Estimated price in VND.
  int get vndPrice => (price * 23000 / 1000).round() * 1000;

  // Discounted price in VND.
  int get vndDiscountedPrice =>
      (price * 23000 * (1 - discountPercentage / 100) / 1000).round() * 1000;
}

extension MockProductPropertiesX on Product {
  int get mockSoldCount => reviews.length * 12;
  int get mockShippingFee => weight * 10000;
}

extension _ProductPrototypeX on Product {
  static final _prototype = Product(
    id: 1,
    title: 'Prototype Product\nPrototype Product',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
    category: 'proto',
    price: 9.99,
    discountPercentage: 7.17,
    rating: 4.94,
    stock: 5,
    tags: ['proto', 'proto2'],
    brand: 'Proto brand',
    sku: '99-Prototype-99',
    weight: 99,
    dimensions: const ProductDimensions(
      width: 9,
      height: 99,
      depth: 999,
    ),
    warrantyInformation: '99 month warranty',
    shippingInformation: 'Ships in 9 month',
    availabilityStatus: 'Low Stock',
    reviews: [],
    returnPolicy: '99 days return policy',
    minimumOrderQuantity: 99,
    meta: ProductMeta(
      createdAt: DateTime.parse('2024-05-23T08:56:21.618Z'),
      updatedAt: DateTime.parse('2024-05-23T08:56:21.618Z'),
      barcode: '9164035109868',
      qrCode: 'https://dummyjson.com/public/qr-code.png',
    ),
    images: [
      'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
    ],
    thumbnail:
        'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
    variantGroups: [
      const ProductVariantGroup(
        id: 1,
        groupName: 'Color',
        variants: [
          ProductVariant(
            id: 1,
            name: 'Black',
          ),
          ProductVariant(
            id: 2,
            name: 'Brown',
          ),
        ],
      ),
      const ProductVariantGroup(
        id: 2,
        groupName: 'Size',
        variants: [
          ProductVariant(
            id: 3,
            name: 'S',
          ),
          ProductVariant(
            id: 4,
            name: 'M',
          ),
          ProductVariant(
            id: 5,
            name: 'L',
          ),
        ],
      ),
    ],
  );
}
