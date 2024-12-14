import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/drift_database_provider.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart';
import 'package:e_commerce/features/products/data/drift_tables/product_table.drift.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_review.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:e_commerce/utils/mock_ids_generator.dart';
import 'package:e_commerce/utils/typedefs.dart';

part 'product.mapper.dart';

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
  }) : variantGroups = _ProductPrototypeX.mockVariantGroup(id!);

  factory Product.fromJson(Map<String, dynamic> json) =>
      ProductMapper.fromJson(json);

  static Future<Product> fromDbData(
    DriftLocalDatabase db,
    ProductTableData data,
  ) {
    return ProductTableDomainConverter.fromDbData(db, data);
  }

  static Product get prototype => _ProductPrototypeX.prototype;
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
  static final prototype = Product(
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

  static List<ProductVariantGroup> mockVariantGroup(DatabaseKey productId) {
    // Because the mocking api does not support product variants, we have to
    // generate it manually.
    //
    // Each product variant group and variants will be prepended with the
    // product id to ensure uniqueness.
    //
    // These two generators will generate unique IDs for each variant group and
    // its variants.
    final variantGroupIdGenerator = MockIdsGenerator(baseId: productId);
    final variantIdGenerator = MockIdsGenerator(baseId: productId);

    return [
      ProductVariantGroup(
        id: variantGroupIdGenerator.moveNextAndGet(),
        groupName: 'Color',
        variants: [
          ProductVariant(
            id: variantIdGenerator.moveNextAndGet(),
            name: 'Black',
          ),
          ProductVariant(
            id: variantIdGenerator.moveNextAndGet(),
            name: 'Brown',
          ),
        ],
      ),
      ProductVariantGroup(
        id: variantGroupIdGenerator.moveNextAndGet(),
        groupName: 'Size',
        variants: [
          ProductVariant(
            id: variantIdGenerator.moveNextAndGet(),
            name: 'S',
          ),
          ProductVariant(
            id: variantIdGenerator.moveNextAndGet(),
            name: 'M',
          ),
          ProductVariant(
            id: variantIdGenerator.moveNextAndGet(),
            name: 'L',
          ),
        ],
      ),
    ];
  }
}
