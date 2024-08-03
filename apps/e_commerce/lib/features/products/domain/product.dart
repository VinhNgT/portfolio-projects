import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/products/domain/product_dimensions.dart';
import 'package:e_commerce/features/products/domain/product_meta.dart';
import 'package:e_commerce/features/products/domain/product_reviews.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';

part 'product.mapper.dart';
part 'product.realm.dart';

@MappableClass()
class Product with ProductMappable {
  final int id;
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
  final List<ProductReviews> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMeta meta;
  final String thumbnail;
  final List<String> images;
  final List<ProductVariantGroup> variantsGroup;

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
    required this.variantsGroup,
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
  }) : variantsGroup = prototype.variantsGroup;

  factory Product.fromRealmObj(ProductRealm realm) =>
      ProductRealmConverter.fromRealmObj(realm);

  factory Product.fromJson(Map<String, dynamic> json) =>
      ProductMapper.fromJson(json);

  static Product get prototype => _ProductPrototypeX._prototype;
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
    variantsGroup: [
      ProductVariantGroup(
        id: Uuid.fromString('84216062-a550-4cb3-a4f5-05548ddfb614'),
        groupName: 'Color',
        variants: [
          ProductVariant(
            id: Uuid.fromString('6db990bd-9d6f-4fc6-b978-78e378dd9f50'),
            name: 'Black',
          ),
          ProductVariant(
            id: Uuid.fromString('4dc94875-d336-41a2-b291-18afbb97cca8'),
            name: 'Brown',
          ),
        ],
      ),
      ProductVariantGroup(
        id: Uuid.fromString('3b8a645c-3ba1-4a22-8d9e-7ccc9f30b780'),
        groupName: 'Size',
        variants: [
          ProductVariant(
            id: Uuid.fromString('ee97d2ad-b3e9-49b2-b86f-3c30091eea9a'),
            name: 'S',
          ),
          ProductVariant(
            id: Uuid.fromString('835e5d1b-c1b1-43d4-a228-9746bb155f68'),
            name: 'M',
          ),
          ProductVariant(
            id: Uuid.fromString('7299624f-7d85-4c30-8d0f-7e4828b5eb08'),
            name: 'L',
          ),
        ],
      ),
    ],
  );
}

@realm
class $ProductRealm {
  @PrimaryKey()
  late int id;

  late String title;
  late String description;
  late String category;
  late double price;
  late double discountPercentage;
  late double rating;
  late int stock;
  late List<String> tags;
  late String? brand;
  late String sku;
  late int weight;
  late $ProductDimensionsRealm? dimensions;
  late String warrantyInformation;
  late String shippingInformation;
  late String availabilityStatus;
  late List<$ProductReviewsRealm> reviews;
  late String returnPolicy;
  late int minimumOrderQuantity;
  late $ProductMetaRealm? meta;
  late String thumbnail;
  late List<String> images;
  late List<$ProductVariantGroupRealm> variantGroups;
}

extension ProductRealmConverter on Product {
  static Product fromRealmObj(ProductRealm obj) {
    return Product(
      id: obj.id,
      title: obj.title,
      description: obj.description,
      category: obj.category,
      price: obj.price,
      discountPercentage: obj.discountPercentage,
      rating: obj.rating,
      stock: obj.stock,
      tags: obj.tags,
      brand: obj.brand,
      sku: obj.sku,
      weight: obj.weight,
      dimensions: ProductDimensions.fromRealmObj(obj.dimensions!),
      warrantyInformation: obj.warrantyInformation,
      shippingInformation: obj.shippingInformation,
      availabilityStatus: obj.availabilityStatus,
      reviews: obj.reviews.map(ProductReviews.fromRealmObj).toList(),
      returnPolicy: obj.returnPolicy,
      minimumOrderQuantity: obj.minimumOrderQuantity,
      meta: ProductMeta.fromRealmObj(obj.meta!),
      thumbnail: obj.thumbnail,
      images: obj.images,
      variantsGroup:
          obj.variantGroups.map(ProductVariantGroup.fromRealmObj).toList(),
    );
  }

  ProductRealm toRealmObj(Realm realm) {
    final variantsGroupRealm = variantsGroup.map(
      (e) => realm.find<ProductVariantGroupRealm>(e.id) ?? e.toRealmObj(realm),
    );

    return ProductRealm(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      tags: tags,
      brand: brand,
      sku: sku,
      weight: weight,
      dimensions: dimensions.toRealmObj(),
      warrantyInformation: warrantyInformation,
      shippingInformation: shippingInformation,
      availabilityStatus: availabilityStatus,
      reviews: reviews.map((e) => e.toRealmObj()),
      returnPolicy: returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity,
      meta: meta.toRealmObj(),
      thumbnail: thumbnail,
      images: images,
      variantGroups: variantsGroupRealm,
    );
  }
}
