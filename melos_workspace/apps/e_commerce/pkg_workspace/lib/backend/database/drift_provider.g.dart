// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_provider.dart';

// ignore_for_file: type=lint
class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  @override
  late final GeneratedColumn<double> discountPercentage =
      GeneratedColumn<double>('discount_percentage', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($ProductTableTable.$convertertags);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dimensionsMeta =
      const VerificationMeta('dimensions');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> dimensions =
      GeneratedColumn<String>('dimensions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($ProductTableTable.$converterdimensions);
  static const VerificationMeta _warrantyInformationMeta =
      const VerificationMeta('warrantyInformation');
  @override
  late final GeneratedColumn<String> warrantyInformation =
      GeneratedColumn<String>('warranty_information', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shippingInformationMeta =
      const VerificationMeta('shippingInformation');
  @override
  late final GeneratedColumn<String> shippingInformation =
      GeneratedColumn<String>('shipping_information', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _availabilityStatusMeta =
      const VerificationMeta('availabilityStatus');
  @override
  late final GeneratedColumn<String> availabilityStatus =
      GeneratedColumn<String>('availability_status', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reviewsMeta =
      const VerificationMeta('reviews');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> reviews =
      GeneratedColumn<String>('reviews', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($ProductTableTable.$converterreviews);
  static const VerificationMeta _returnPolicyMeta =
      const VerificationMeta('returnPolicy');
  @override
  late final GeneratedColumn<String> returnPolicy = GeneratedColumn<String>(
      'return_policy', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minimumOrderQuantityMeta =
      const VerificationMeta('minimumOrderQuantity');
  @override
  late final GeneratedColumn<int> minimumOrderQuantity = GeneratedColumn<int>(
      'minimum_order_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _metaMeta = const VerificationMeta('meta');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> meta =
      GeneratedColumn<String>('meta', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($ProductTableTable.$convertermeta);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String> images =
      GeneratedColumn<String>('images', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>($ProductTableTable.$converterimages);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        stock,
        tags,
        brand,
        sku,
        weight,
        dimensions,
        warrantyInformation,
        shippingInformation,
        availabilityStatus,
        reviews,
        returnPolicy,
        minimumOrderQuantity,
        meta,
        thumbnail,
        images
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProductTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage']!, _discountPercentageMeta));
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    context.handle(_dimensionsMeta, const VerificationResult.success());
    if (data.containsKey('warranty_information')) {
      context.handle(
          _warrantyInformationMeta,
          warrantyInformation.isAcceptableOrUnknown(
              data['warranty_information']!, _warrantyInformationMeta));
    } else if (isInserting) {
      context.missing(_warrantyInformationMeta);
    }
    if (data.containsKey('shipping_information')) {
      context.handle(
          _shippingInformationMeta,
          shippingInformation.isAcceptableOrUnknown(
              data['shipping_information']!, _shippingInformationMeta));
    } else if (isInserting) {
      context.missing(_shippingInformationMeta);
    }
    if (data.containsKey('availability_status')) {
      context.handle(
          _availabilityStatusMeta,
          availabilityStatus.isAcceptableOrUnknown(
              data['availability_status']!, _availabilityStatusMeta));
    } else if (isInserting) {
      context.missing(_availabilityStatusMeta);
    }
    context.handle(_reviewsMeta, const VerificationResult.success());
    if (data.containsKey('return_policy')) {
      context.handle(
          _returnPolicyMeta,
          returnPolicy.isAcceptableOrUnknown(
              data['return_policy']!, _returnPolicyMeta));
    } else if (isInserting) {
      context.missing(_returnPolicyMeta);
    }
    if (data.containsKey('minimum_order_quantity')) {
      context.handle(
          _minimumOrderQuantityMeta,
          minimumOrderQuantity.isAcceptableOrUnknown(
              data['minimum_order_quantity']!, _minimumOrderQuantityMeta));
    } else if (isInserting) {
      context.missing(_minimumOrderQuantityMeta);
    }
    context.handle(_metaMeta, const VerificationResult.success());
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    context.handle(_imagesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      discountPercentage: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}discount_percentage'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      tags: $ProductTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight'])!,
      dimensions: $ProductTableTable.$converterdimensions.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}dimensions'])!),
      warrantyInformation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}warranty_information'])!,
      shippingInformation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shipping_information'])!,
      availabilityStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}availability_status'])!,
      reviews: $ProductTableTable.$converterreviews.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reviews'])!),
      returnPolicy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}return_policy'])!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}minimum_order_quantity'])!,
      meta: $ProductTableTable.$convertermeta.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meta'])!),
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
      images: $ProductTableTable.$converterimages.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}images'])!),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }

  static TypeConverter<dynamic, String> $convertertags =
      const DbJsonConverter();
  static TypeConverter<dynamic, String> $converterdimensions =
      const DbJsonConverter();
  static TypeConverter<dynamic, String> $converterreviews =
      const DbJsonConverter();
  static TypeConverter<dynamic, String> $convertermeta =
      const DbJsonConverter();
  static TypeConverter<dynamic, String> $converterimages =
      const DbJsonConverter();
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final dynamic tags;
  final String? brand;
  final String sku;
  final int weight;
  final dynamic dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final dynamic reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final dynamic meta;
  final String thumbnail;
  final dynamic images;
  const ProductTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.stock,
      this.tags,
      this.brand,
      required this.sku,
      required this.weight,
      this.dimensions,
      required this.warrantyInformation,
      required this.shippingInformation,
      required this.availabilityStatus,
      this.reviews,
      required this.returnPolicy,
      required this.minimumOrderQuantity,
      this.meta,
      required this.thumbnail,
      this.images});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    map['discount_percentage'] = Variable<double>(discountPercentage);
    map['rating'] = Variable<double>(rating);
    map['stock'] = Variable<int>(stock);
    if (!nullToAbsent || tags != null) {
      map['tags'] =
          Variable<String>($ProductTableTable.$convertertags.toSql(tags));
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    map['sku'] = Variable<String>(sku);
    map['weight'] = Variable<int>(weight);
    if (!nullToAbsent || dimensions != null) {
      map['dimensions'] = Variable<String>(
          $ProductTableTable.$converterdimensions.toSql(dimensions));
    }
    map['warranty_information'] = Variable<String>(warrantyInformation);
    map['shipping_information'] = Variable<String>(shippingInformation);
    map['availability_status'] = Variable<String>(availabilityStatus);
    if (!nullToAbsent || reviews != null) {
      map['reviews'] =
          Variable<String>($ProductTableTable.$converterreviews.toSql(reviews));
    }
    map['return_policy'] = Variable<String>(returnPolicy);
    map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity);
    if (!nullToAbsent || meta != null) {
      map['meta'] =
          Variable<String>($ProductTableTable.$convertermeta.toSql(meta));
    }
    map['thumbnail'] = Variable<String>(thumbnail);
    if (!nullToAbsent || images != null) {
      map['images'] =
          Variable<String>($ProductTableTable.$converterimages.toSql(images));
    }
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      category: Value(category),
      price: Value(price),
      discountPercentage: Value(discountPercentage),
      rating: Value(rating),
      stock: Value(stock),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      sku: Value(sku),
      weight: Value(weight),
      dimensions: dimensions == null && nullToAbsent
          ? const Value.absent()
          : Value(dimensions),
      warrantyInformation: Value(warrantyInformation),
      shippingInformation: Value(shippingInformation),
      availabilityStatus: Value(availabilityStatus),
      reviews: reviews == null && nullToAbsent
          ? const Value.absent()
          : Value(reviews),
      returnPolicy: Value(returnPolicy),
      minimumOrderQuantity: Value(minimumOrderQuantity),
      meta: meta == null && nullToAbsent ? const Value.absent() : Value(meta),
      thumbnail: Value(thumbnail),
      images:
          images == null && nullToAbsent ? const Value.absent() : Value(images),
    );
  }

  factory ProductTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      rating: serializer.fromJson<double>(json['rating']),
      stock: serializer.fromJson<int>(json['stock']),
      tags: serializer.fromJson<dynamic>(json['tags']),
      brand: serializer.fromJson<String?>(json['brand']),
      sku: serializer.fromJson<String>(json['sku']),
      weight: serializer.fromJson<int>(json['weight']),
      dimensions: serializer.fromJson<dynamic>(json['dimensions']),
      warrantyInformation:
          serializer.fromJson<String>(json['warrantyInformation']),
      shippingInformation:
          serializer.fromJson<String>(json['shippingInformation']),
      availabilityStatus:
          serializer.fromJson<String>(json['availabilityStatus']),
      reviews: serializer.fromJson<dynamic>(json['reviews']),
      returnPolicy: serializer.fromJson<String>(json['returnPolicy']),
      minimumOrderQuantity:
          serializer.fromJson<int>(json['minimumOrderQuantity']),
      meta: serializer.fromJson<dynamic>(json['meta']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      images: serializer.fromJson<dynamic>(json['images']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'rating': serializer.toJson<double>(rating),
      'stock': serializer.toJson<int>(stock),
      'tags': serializer.toJson<dynamic>(tags),
      'brand': serializer.toJson<String?>(brand),
      'sku': serializer.toJson<String>(sku),
      'weight': serializer.toJson<int>(weight),
      'dimensions': serializer.toJson<dynamic>(dimensions),
      'warrantyInformation': serializer.toJson<String>(warrantyInformation),
      'shippingInformation': serializer.toJson<String>(shippingInformation),
      'availabilityStatus': serializer.toJson<String>(availabilityStatus),
      'reviews': serializer.toJson<dynamic>(reviews),
      'returnPolicy': serializer.toJson<String>(returnPolicy),
      'minimumOrderQuantity': serializer.toJson<int>(minimumOrderQuantity),
      'meta': serializer.toJson<dynamic>(meta),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'images': serializer.toJson<dynamic>(images),
    };
  }

  ProductTableData copyWith(
          {int? id,
          String? title,
          String? description,
          String? category,
          double? price,
          double? discountPercentage,
          double? rating,
          int? stock,
          Value<dynamic> tags = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          String? sku,
          int? weight,
          Value<dynamic> dimensions = const Value.absent(),
          String? warrantyInformation,
          String? shippingInformation,
          String? availabilityStatus,
          Value<dynamic> reviews = const Value.absent(),
          String? returnPolicy,
          int? minimumOrderQuantity,
          Value<dynamic> meta = const Value.absent(),
          String? thumbnail,
          Value<dynamic> images = const Value.absent()}) =>
      ProductTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags.present ? tags.value : this.tags,
        brand: brand.present ? brand.value : this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions.present ? dimensions.value : this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews.present ? reviews.value : this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta.present ? meta.value : this.meta,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images.present ? images.value : this.images,
      );
  ProductTableData copyWithCompanion(ProductTableCompanion data) {
    return ProductTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      discountPercentage: data.discountPercentage.present
          ? data.discountPercentage.value
          : this.discountPercentage,
      rating: data.rating.present ? data.rating.value : this.rating,
      stock: data.stock.present ? data.stock.value : this.stock,
      tags: data.tags.present ? data.tags.value : this.tags,
      brand: data.brand.present ? data.brand.value : this.brand,
      sku: data.sku.present ? data.sku.value : this.sku,
      weight: data.weight.present ? data.weight.value : this.weight,
      dimensions:
          data.dimensions.present ? data.dimensions.value : this.dimensions,
      warrantyInformation: data.warrantyInformation.present
          ? data.warrantyInformation.value
          : this.warrantyInformation,
      shippingInformation: data.shippingInformation.present
          ? data.shippingInformation.value
          : this.shippingInformation,
      availabilityStatus: data.availabilityStatus.present
          ? data.availabilityStatus.value
          : this.availabilityStatus,
      reviews: data.reviews.present ? data.reviews.value : this.reviews,
      returnPolicy: data.returnPolicy.present
          ? data.returnPolicy.value
          : this.returnPolicy,
      minimumOrderQuantity: data.minimumOrderQuantity.present
          ? data.minimumOrderQuantity.value
          : this.minimumOrderQuantity,
      meta: data.meta.present ? data.meta.value : this.meta,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      images: data.images.present ? data.images.value : this.images,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('tags: $tags, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('weight: $weight, ')
          ..write('dimensions: $dimensions, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('reviews: $reviews, ')
          ..write('returnPolicy: $returnPolicy, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('meta: $meta, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        description,
        category,
        price,
        discountPercentage,
        rating,
        stock,
        tags,
        brand,
        sku,
        weight,
        dimensions,
        warrantyInformation,
        shippingInformation,
        availabilityStatus,
        reviews,
        returnPolicy,
        minimumOrderQuantity,
        meta,
        thumbnail,
        images
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.price == this.price &&
          other.discountPercentage == this.discountPercentage &&
          other.rating == this.rating &&
          other.stock == this.stock &&
          other.tags == this.tags &&
          other.brand == this.brand &&
          other.sku == this.sku &&
          other.weight == this.weight &&
          other.dimensions == this.dimensions &&
          other.warrantyInformation == this.warrantyInformation &&
          other.shippingInformation == this.shippingInformation &&
          other.availabilityStatus == this.availabilityStatus &&
          other.reviews == this.reviews &&
          other.returnPolicy == this.returnPolicy &&
          other.minimumOrderQuantity == this.minimumOrderQuantity &&
          other.meta == this.meta &&
          other.thumbnail == this.thumbnail &&
          other.images == this.images);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> category;
  final Value<double> price;
  final Value<double> discountPercentage;
  final Value<double> rating;
  final Value<int> stock;
  final Value<dynamic> tags;
  final Value<String?> brand;
  final Value<String> sku;
  final Value<int> weight;
  final Value<dynamic> dimensions;
  final Value<String> warrantyInformation;
  final Value<String> shippingInformation;
  final Value<String> availabilityStatus;
  final Value<dynamic> reviews;
  final Value<String> returnPolicy;
  final Value<int> minimumOrderQuantity;
  final Value<dynamic> meta;
  final Value<String> thumbnail;
  final Value<dynamic> images;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.rating = const Value.absent(),
    this.stock = const Value.absent(),
    this.tags = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.weight = const Value.absent(),
    this.dimensions = const Value.absent(),
    this.warrantyInformation = const Value.absent(),
    this.shippingInformation = const Value.absent(),
    this.availabilityStatus = const Value.absent(),
    this.reviews = const Value.absent(),
    this.returnPolicy = const Value.absent(),
    this.minimumOrderQuantity = const Value.absent(),
    this.meta = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.images = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required dynamic tags,
    this.brand = const Value.absent(),
    required String sku,
    required int weight,
    required dynamic dimensions,
    required String warrantyInformation,
    required String shippingInformation,
    required String availabilityStatus,
    required dynamic reviews,
    required String returnPolicy,
    required int minimumOrderQuantity,
    required dynamic meta,
    required String thumbnail,
    required dynamic images,
  })  : title = Value(title),
        description = Value(description),
        category = Value(category),
        price = Value(price),
        discountPercentage = Value(discountPercentage),
        rating = Value(rating),
        stock = Value(stock),
        tags = Value(tags),
        sku = Value(sku),
        weight = Value(weight),
        dimensions = Value(dimensions),
        warrantyInformation = Value(warrantyInformation),
        shippingInformation = Value(shippingInformation),
        availabilityStatus = Value(availabilityStatus),
        reviews = Value(reviews),
        returnPolicy = Value(returnPolicy),
        minimumOrderQuantity = Value(minimumOrderQuantity),
        meta = Value(meta),
        thumbnail = Value(thumbnail),
        images = Value(images);
  static Insertable<ProductTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? discountPercentage,
    Expression<double>? rating,
    Expression<int>? stock,
    Expression<String>? tags,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<int>? weight,
    Expression<String>? dimensions,
    Expression<String>? warrantyInformation,
    Expression<String>? shippingInformation,
    Expression<String>? availabilityStatus,
    Expression<String>? reviews,
    Expression<String>? returnPolicy,
    Expression<int>? minimumOrderQuantity,
    Expression<String>? meta,
    Expression<String>? thumbnail,
    Expression<String>? images,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (rating != null) 'rating': rating,
      if (stock != null) 'stock': stock,
      if (tags != null) 'tags': tags,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (weight != null) 'weight': weight,
      if (dimensions != null) 'dimensions': dimensions,
      if (warrantyInformation != null)
        'warranty_information': warrantyInformation,
      if (shippingInformation != null)
        'shipping_information': shippingInformation,
      if (availabilityStatus != null) 'availability_status': availabilityStatus,
      if (reviews != null) 'reviews': reviews,
      if (returnPolicy != null) 'return_policy': returnPolicy,
      if (minimumOrderQuantity != null)
        'minimum_order_quantity': minimumOrderQuantity,
      if (meta != null) 'meta': meta,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (images != null) 'images': images,
    });
  }

  ProductTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? category,
      Value<double>? price,
      Value<double>? discountPercentage,
      Value<double>? rating,
      Value<int>? stock,
      Value<dynamic>? tags,
      Value<String?>? brand,
      Value<String>? sku,
      Value<int>? weight,
      Value<dynamic>? dimensions,
      Value<String>? warrantyInformation,
      Value<String>? shippingInformation,
      Value<String>? availabilityStatus,
      Value<dynamic>? reviews,
      Value<String>? returnPolicy,
      Value<int>? minimumOrderQuantity,
      Value<dynamic>? meta,
      Value<String>? thumbnail,
      Value<dynamic>? images}) {
    return ProductTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($ProductTableTable.$convertertags.toSql(tags.value));
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (dimensions.present) {
      map['dimensions'] = Variable<String>(
          $ProductTableTable.$converterdimensions.toSql(dimensions.value));
    }
    if (warrantyInformation.present) {
      map['warranty_information'] = Variable<String>(warrantyInformation.value);
    }
    if (shippingInformation.present) {
      map['shipping_information'] = Variable<String>(shippingInformation.value);
    }
    if (availabilityStatus.present) {
      map['availability_status'] = Variable<String>(availabilityStatus.value);
    }
    if (reviews.present) {
      map['reviews'] = Variable<String>(
          $ProductTableTable.$converterreviews.toSql(reviews.value));
    }
    if (returnPolicy.present) {
      map['return_policy'] = Variable<String>(returnPolicy.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] = Variable<int>(minimumOrderQuantity.value);
    }
    if (meta.present) {
      map['meta'] =
          Variable<String>($ProductTableTable.$convertermeta.toSql(meta.value));
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(
          $ProductTableTable.$converterimages.toSql(images.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('rating: $rating, ')
          ..write('stock: $stock, ')
          ..write('tags: $tags, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('weight: $weight, ')
          ..write('dimensions: $dimensions, ')
          ..write('warrantyInformation: $warrantyInformation, ')
          ..write('shippingInformation: $shippingInformation, ')
          ..write('availabilityStatus: $availabilityStatus, ')
          ..write('reviews: $reviews, ')
          ..write('returnPolicy: $returnPolicy, ')
          ..write('minimumOrderQuantity: $minimumOrderQuantity, ')
          ..write('meta: $meta, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }
}

class $ProductVariantGroupTableTable extends ProductVariantGroupTable
    with
        TableInfo<$ProductVariantGroupTableTable,
            ProductVariantGroupTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantGroupTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groupNameMeta =
      const VerificationMeta('groupName');
  @override
  late final GeneratedColumn<String> groupName = GeneratedColumn<String>(
      'group_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES product_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, groupName, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variant_group_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductVariantGroupTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('group_name')) {
      context.handle(_groupNameMeta,
          groupName.isAcceptableOrUnknown(data['group_name']!, _groupNameMeta));
    } else if (isInserting) {
      context.missing(_groupNameMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductVariantGroupTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductVariantGroupTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      groupName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_name'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $ProductVariantGroupTableTable createAlias(String alias) {
    return $ProductVariantGroupTableTable(attachedDatabase, alias);
  }
}

class ProductVariantGroupTableData extends DataClass
    implements Insertable<ProductVariantGroupTableData> {
  final int id;
  final String groupName;
  final int productId;
  const ProductVariantGroupTableData(
      {required this.id, required this.groupName, required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group_name'] = Variable<String>(groupName);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  ProductVariantGroupTableCompanion toCompanion(bool nullToAbsent) {
    return ProductVariantGroupTableCompanion(
      id: Value(id),
      groupName: Value(groupName),
      productId: Value(productId),
    );
  }

  factory ProductVariantGroupTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductVariantGroupTableData(
      id: serializer.fromJson<int>(json['id']),
      groupName: serializer.fromJson<String>(json['groupName']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupName': serializer.toJson<String>(groupName),
      'productId': serializer.toJson<int>(productId),
    };
  }

  ProductVariantGroupTableData copyWith(
          {int? id, String? groupName, int? productId}) =>
      ProductVariantGroupTableData(
        id: id ?? this.id,
        groupName: groupName ?? this.groupName,
        productId: productId ?? this.productId,
      );
  ProductVariantGroupTableData copyWithCompanion(
      ProductVariantGroupTableCompanion data) {
    return ProductVariantGroupTableData(
      id: data.id.present ? data.id.value : this.id,
      groupName: data.groupName.present ? data.groupName.value : this.groupName,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantGroupTableData(')
          ..write('id: $id, ')
          ..write('groupName: $groupName, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groupName, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariantGroupTableData &&
          other.id == this.id &&
          other.groupName == this.groupName &&
          other.productId == this.productId);
}

class ProductVariantGroupTableCompanion
    extends UpdateCompanion<ProductVariantGroupTableData> {
  final Value<int> id;
  final Value<String> groupName;
  final Value<int> productId;
  const ProductVariantGroupTableCompanion({
    this.id = const Value.absent(),
    this.groupName = const Value.absent(),
    this.productId = const Value.absent(),
  });
  ProductVariantGroupTableCompanion.insert({
    this.id = const Value.absent(),
    required String groupName,
    required int productId,
  })  : groupName = Value(groupName),
        productId = Value(productId);
  static Insertable<ProductVariantGroupTableData> custom({
    Expression<int>? id,
    Expression<String>? groupName,
    Expression<int>? productId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupName != null) 'group_name': groupName,
      if (productId != null) 'product_id': productId,
    });
  }

  ProductVariantGroupTableCompanion copyWith(
      {Value<int>? id, Value<String>? groupName, Value<int>? productId}) {
    return ProductVariantGroupTableCompanion(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupName.present) {
      map['group_name'] = Variable<String>(groupName.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantGroupTableCompanion(')
          ..write('id: $id, ')
          ..write('groupName: $groupName, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

class $ProductVariantTableTable extends ProductVariantTable
    with TableInfo<$ProductVariantTableTable, ProductVariantTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_variant_group_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variant_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductVariantTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductVariantTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductVariantTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $ProductVariantTableTable createAlias(String alias) {
    return $ProductVariantTableTable(attachedDatabase, alias);
  }
}

class ProductVariantTableData extends DataClass
    implements Insertable<ProductVariantTableData> {
  final int id;
  final String name;
  final int groupId;
  const ProductVariantTableData(
      {required this.id, required this.name, required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['group_id'] = Variable<int>(groupId);
    return map;
  }

  ProductVariantTableCompanion toCompanion(bool nullToAbsent) {
    return ProductVariantTableCompanion(
      id: Value(id),
      name: Value(name),
      groupId: Value(groupId),
    );
  }

  factory ProductVariantTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductVariantTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      groupId: serializer.fromJson<int>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'groupId': serializer.toJson<int>(groupId),
    };
  }

  ProductVariantTableData copyWith({int? id, String? name, int? groupId}) =>
      ProductVariantTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        groupId: groupId ?? this.groupId,
      );
  ProductVariantTableData copyWithCompanion(ProductVariantTableCompanion data) {
    return ProductVariantTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductVariantTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.groupId == this.groupId);
}

class ProductVariantTableCompanion
    extends UpdateCompanion<ProductVariantTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> groupId;
  const ProductVariantTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.groupId = const Value.absent(),
  });
  ProductVariantTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int groupId,
  })  : name = Value(name),
        groupId = Value(groupId);
  static Insertable<ProductVariantTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? groupId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (groupId != null) 'group_id': groupId,
    });
  }

  ProductVariantTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? groupId}) {
    return ProductVariantTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductVariantTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }
}

class $CartTableTable extends CartTable
    with TableInfo<$CartTableTable, CartTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_table';
  @override
  VerificationContext validateIntegrity(Insertable<CartTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $CartTableTable createAlias(String alias) {
    return $CartTableTable(attachedDatabase, alias);
  }
}

class CartTableData extends DataClass implements Insertable<CartTableData> {
  final int id;
  const CartTableData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  CartTableCompanion toCompanion(bool nullToAbsent) {
    return CartTableCompanion(
      id: Value(id),
    );
  }

  factory CartTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartTableData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  CartTableData copyWith({int? id}) => CartTableData(
        id: id ?? this.id,
      );
  CartTableData copyWithCompanion(CartTableCompanion data) {
    return CartTableData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartTableData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CartTableData && other.id == this.id);
}

class CartTableCompanion extends UpdateCompanion<CartTableData> {
  final Value<int> id;
  const CartTableCompanion({
    this.id = const Value.absent(),
  });
  CartTableCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<CartTableData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  CartTableCompanion copyWith({Value<int>? id}) {
    return CartTableCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $OrderItemTableTable extends OrderItemTable
    with TableInfo<$OrderItemTableTable, OrderItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      check: () => ComparableExpr(quantity).isBiggerOrEqualValue(0),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_table';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $OrderItemTableTable createAlias(String alias) {
    return $OrderItemTableTable(attachedDatabase, alias);
  }
}

class OrderItemTableData extends DataClass
    implements Insertable<OrderItemTableData> {
  final int id;
  final int quantity;
  const OrderItemTableData({required this.id, required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  OrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemTableCompanion(
      id: Value(id),
      quantity: Value(quantity),
    );
  }

  factory OrderItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  OrderItemTableData copyWith({int? id, int? quantity}) => OrderItemTableData(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
      );
  OrderItemTableData copyWithCompanion(OrderItemTableCompanion data) {
    return OrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableData(')
          ..write('id: $id, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemTableData &&
          other.id == this.id &&
          other.quantity == this.quantity);
}

class OrderItemTableCompanion extends UpdateCompanion<OrderItemTableData> {
  final Value<int> id;
  final Value<int> quantity;
  const OrderItemTableCompanion({
    this.id = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int quantity,
  }) : quantity = Value(quantity);
  static Insertable<OrderItemTableData> custom({
    Expression<int>? id,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quantity != null) 'quantity': quantity,
    });
  }

  OrderItemTableCompanion copyWith({Value<int>? id, Value<int>? quantity}) {
    return OrderItemTableCompanion(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $CartItemTableTable extends CartItemTable
    with TableInfo<$CartItemTableTable, CartItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _isIncludeInOrderMeta =
      const VerificationMeta('isIncludeInOrder');
  @override
  late final GeneratedColumn<bool> isIncludeInOrder = GeneratedColumn<bool>(
      'is_include_in_order', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_include_in_order" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _orderItemIdMeta =
      const VerificationMeta('orderItemId');
  @override
  late final GeneratedColumn<int> orderItemId = GeneratedColumn<int>(
      'order_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES order_item_table (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [isIncludeInOrder, orderItemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_item_table';
  @override
  VerificationContext validateIntegrity(Insertable<CartItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('is_include_in_order')) {
      context.handle(
          _isIncludeInOrderMeta,
          isIncludeInOrder.isAcceptableOrUnknown(
              data['is_include_in_order']!, _isIncludeInOrderMeta));
    }
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id']!, _orderItemIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderItemId};
  @override
  CartItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItemTableData(
      isIncludeInOrder: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_include_in_order'])!,
      orderItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_item_id'])!,
    );
  }

  @override
  $CartItemTableTable createAlias(String alias) {
    return $CartItemTableTable(attachedDatabase, alias);
  }
}

class CartItemTableData extends DataClass
    implements Insertable<CartItemTableData> {
  final bool isIncludeInOrder;
  final int orderItemId;
  const CartItemTableData(
      {required this.isIncludeInOrder, required this.orderItemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['is_include_in_order'] = Variable<bool>(isIncludeInOrder);
    map['order_item_id'] = Variable<int>(orderItemId);
    return map;
  }

  CartItemTableCompanion toCompanion(bool nullToAbsent) {
    return CartItemTableCompanion(
      isIncludeInOrder: Value(isIncludeInOrder),
      orderItemId: Value(orderItemId),
    );
  }

  factory CartItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItemTableData(
      isIncludeInOrder: serializer.fromJson<bool>(json['isIncludeInOrder']),
      orderItemId: serializer.fromJson<int>(json['orderItemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isIncludeInOrder': serializer.toJson<bool>(isIncludeInOrder),
      'orderItemId': serializer.toJson<int>(orderItemId),
    };
  }

  CartItemTableData copyWith({bool? isIncludeInOrder, int? orderItemId}) =>
      CartItemTableData(
        isIncludeInOrder: isIncludeInOrder ?? this.isIncludeInOrder,
        orderItemId: orderItemId ?? this.orderItemId,
      );
  CartItemTableData copyWithCompanion(CartItemTableCompanion data) {
    return CartItemTableData(
      isIncludeInOrder: data.isIncludeInOrder.present
          ? data.isIncludeInOrder.value
          : this.isIncludeInOrder,
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTableData(')
          ..write('isIncludeInOrder: $isIncludeInOrder, ')
          ..write('orderItemId: $orderItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(isIncludeInOrder, orderItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemTableData &&
          other.isIncludeInOrder == this.isIncludeInOrder &&
          other.orderItemId == this.orderItemId);
}

class CartItemTableCompanion extends UpdateCompanion<CartItemTableData> {
  final Value<bool> isIncludeInOrder;
  final Value<int> orderItemId;
  const CartItemTableCompanion({
    this.isIncludeInOrder = const Value.absent(),
    this.orderItemId = const Value.absent(),
  });
  CartItemTableCompanion.insert({
    this.isIncludeInOrder = const Value.absent(),
    this.orderItemId = const Value.absent(),
  });
  static Insertable<CartItemTableData> custom({
    Expression<bool>? isIncludeInOrder,
    Expression<int>? orderItemId,
  }) {
    return RawValuesInsertable({
      if (isIncludeInOrder != null) 'is_include_in_order': isIncludeInOrder,
      if (orderItemId != null) 'order_item_id': orderItemId,
    });
  }

  CartItemTableCompanion copyWith(
      {Value<bool>? isIncludeInOrder, Value<int>? orderItemId}) {
    return CartItemTableCompanion(
      isIncludeInOrder: isIncludeInOrder ?? this.isIncludeInOrder,
      orderItemId: orderItemId ?? this.orderItemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (isIncludeInOrder.present) {
      map['is_include_in_order'] = Variable<bool>(isIncludeInOrder.value);
    }
    if (orderItemId.present) {
      map['order_item_id'] = Variable<int>(orderItemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTableCompanion(')
          ..write('isIncludeInOrder: $isIncludeInOrder, ')
          ..write('orderItemId: $orderItemId')
          ..write(')'))
        .toString();
  }
}

class $OrderItemVariantSelectionTableTable
    extends OrderItemVariantSelectionTable
    with
        TableInfo<$OrderItemVariantSelectionTableTable,
            OrderItemVariantSelectionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemVariantSelectionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _orderItemIdMeta =
      const VerificationMeta('orderItemId');
  @override
  late final GeneratedColumn<int> orderItemId = GeneratedColumn<int>(
      'order_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES order_item_table (id) ON DELETE CASCADE'));
  static const VerificationMeta _variantIdMeta =
      const VerificationMeta('variantId');
  @override
  late final GeneratedColumn<int> variantId = GeneratedColumn<int>(
      'variant_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_variant_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [orderItemId, variantId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_variant_selection_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrderItemVariantSelectionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id']!, _orderItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(_variantIdMeta,
          variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta));
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderItemId, variantId};
  @override
  OrderItemVariantSelectionTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemVariantSelectionTableData(
      orderItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_item_id'])!,
      variantId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}variant_id'])!,
    );
  }

  @override
  $OrderItemVariantSelectionTableTable createAlias(String alias) {
    return $OrderItemVariantSelectionTableTable(attachedDatabase, alias);
  }
}

class OrderItemVariantSelectionTableData extends DataClass
    implements Insertable<OrderItemVariantSelectionTableData> {
  final int orderItemId;
  final int variantId;
  const OrderItemVariantSelectionTableData(
      {required this.orderItemId, required this.variantId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['order_item_id'] = Variable<int>(orderItemId);
    map['variant_id'] = Variable<int>(variantId);
    return map;
  }

  OrderItemVariantSelectionTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemVariantSelectionTableCompanion(
      orderItemId: Value(orderItemId),
      variantId: Value(variantId),
    );
  }

  factory OrderItemVariantSelectionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemVariantSelectionTableData(
      orderItemId: serializer.fromJson<int>(json['orderItemId']),
      variantId: serializer.fromJson<int>(json['variantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'orderItemId': serializer.toJson<int>(orderItemId),
      'variantId': serializer.toJson<int>(variantId),
    };
  }

  OrderItemVariantSelectionTableData copyWith(
          {int? orderItemId, int? variantId}) =>
      OrderItemVariantSelectionTableData(
        orderItemId: orderItemId ?? this.orderItemId,
        variantId: variantId ?? this.variantId,
      );
  OrderItemVariantSelectionTableData copyWithCompanion(
      OrderItemVariantSelectionTableCompanion data) {
    return OrderItemVariantSelectionTableData(
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemVariantSelectionTableData(')
          ..write('orderItemId: $orderItemId, ')
          ..write('variantId: $variantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(orderItemId, variantId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemVariantSelectionTableData &&
          other.orderItemId == this.orderItemId &&
          other.variantId == this.variantId);
}

class OrderItemVariantSelectionTableCompanion
    extends UpdateCompanion<OrderItemVariantSelectionTableData> {
  final Value<int> orderItemId;
  final Value<int> variantId;
  final Value<int> rowid;
  const OrderItemVariantSelectionTableCompanion({
    this.orderItemId = const Value.absent(),
    this.variantId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderItemVariantSelectionTableCompanion.insert({
    required int orderItemId,
    required int variantId,
    this.rowid = const Value.absent(),
  })  : orderItemId = Value(orderItemId),
        variantId = Value(variantId);
  static Insertable<OrderItemVariantSelectionTableData> custom({
    Expression<int>? orderItemId,
    Expression<int>? variantId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (variantId != null) 'variant_id': variantId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderItemVariantSelectionTableCompanion copyWith(
      {Value<int>? orderItemId, Value<int>? variantId, Value<int>? rowid}) {
    return OrderItemVariantSelectionTableCompanion(
      orderItemId: orderItemId ?? this.orderItemId,
      variantId: variantId ?? this.variantId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (orderItemId.present) {
      map['order_item_id'] = Variable<int>(orderItemId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<int>(variantId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemVariantSelectionTableCompanion(')
          ..write('orderItemId: $orderItemId, ')
          ..write('variantId: $variantId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $ProductVariantGroupTableTable productVariantGroupTable =
      $ProductVariantGroupTableTable(this);
  late final $ProductVariantTableTable productVariantTable =
      $ProductVariantTableTable(this);
  late final $CartTableTable cartTable = $CartTableTable(this);
  late final $OrderItemTableTable orderItemTable = $OrderItemTableTable(this);
  late final $CartItemTableTable cartItemTable = $CartItemTableTable(this);
  late final $OrderItemVariantSelectionTableTable
      orderItemVariantSelectionTable =
      $OrderItemVariantSelectionTableTable(this);
  late final OrderItemTableDao orderItemTableDao =
      OrderItemTableDao(this as AppDatabase);
  late final OrderItemVariantSelectionTableDao
      orderItemVariantSelectionTableDao =
      OrderItemVariantSelectionTableDao(this as AppDatabase);
  late final CartItemTableDao cartItemTableDao =
      CartItemTableDao(this as AppDatabase);
  late final ProductTableDao productTableDao =
      ProductTableDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        productTable,
        productVariantGroupTable,
        productVariantTable,
        cartTable,
        orderItemTable,
        cartItemTable,
        orderItemVariantSelectionTable
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('order_item_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('cart_item_table', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('order_item_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('order_item_variant_selection_table',
                  kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ProductTableTableCreateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  required String title,
  required String description,
  required String category,
  required double price,
  required double discountPercentage,
  required double rating,
  required int stock,
  required dynamic tags,
  Value<String?> brand,
  required String sku,
  required int weight,
  required dynamic dimensions,
  required String warrantyInformation,
  required String shippingInformation,
  required String availabilityStatus,
  required dynamic reviews,
  required String returnPolicy,
  required int minimumOrderQuantity,
  required dynamic meta,
  required String thumbnail,
  required dynamic images,
});
typedef $$ProductTableTableUpdateCompanionBuilder = ProductTableCompanion
    Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> category,
  Value<double> price,
  Value<double> discountPercentage,
  Value<double> rating,
  Value<int> stock,
  Value<dynamic> tags,
  Value<String?> brand,
  Value<String> sku,
  Value<int> weight,
  Value<dynamic> dimensions,
  Value<String> warrantyInformation,
  Value<String> shippingInformation,
  Value<String> availabilityStatus,
  Value<dynamic> reviews,
  Value<String> returnPolicy,
  Value<int> minimumOrderQuantity,
  Value<dynamic> meta,
  Value<String> thumbnail,
  Value<dynamic> images,
});

class $$ProductTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductTableTable,
    ProductTableData,
    $$ProductTableTableFilterComposer,
    $$ProductTableTableOrderingComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder> {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double> discountPercentage = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<int> stock = const Value.absent(),
            Value<dynamic> tags = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String> sku = const Value.absent(),
            Value<int> weight = const Value.absent(),
            Value<dynamic> dimensions = const Value.absent(),
            Value<String> warrantyInformation = const Value.absent(),
            Value<String> shippingInformation = const Value.absent(),
            Value<String> availabilityStatus = const Value.absent(),
            Value<dynamic> reviews = const Value.absent(),
            Value<String> returnPolicy = const Value.absent(),
            Value<int> minimumOrderQuantity = const Value.absent(),
            Value<dynamic> meta = const Value.absent(),
            Value<String> thumbnail = const Value.absent(),
            Value<dynamic> images = const Value.absent(),
          }) =>
              ProductTableCompanion(
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
            dimensions: dimensions,
            warrantyInformation: warrantyInformation,
            shippingInformation: shippingInformation,
            availabilityStatus: availabilityStatus,
            reviews: reviews,
            returnPolicy: returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity,
            meta: meta,
            thumbnail: thumbnail,
            images: images,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            required String category,
            required double price,
            required double discountPercentage,
            required double rating,
            required int stock,
            required dynamic tags,
            Value<String?> brand = const Value.absent(),
            required String sku,
            required int weight,
            required dynamic dimensions,
            required String warrantyInformation,
            required String shippingInformation,
            required String availabilityStatus,
            required dynamic reviews,
            required String returnPolicy,
            required int minimumOrderQuantity,
            required dynamic meta,
            required String thumbnail,
            required dynamic images,
          }) =>
              ProductTableCompanion.insert(
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
            dimensions: dimensions,
            warrantyInformation: warrantyInformation,
            shippingInformation: shippingInformation,
            availabilityStatus: availabilityStatus,
            reviews: reviews,
            returnPolicy: returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity,
            meta: meta,
            thumbnail: thumbnail,
            images: images,
          ),
        ));
}

class $$ProductTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get discountPercentage => $state.composableBuilder(
      column: $state.table.discountPercentage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get rating => $state.composableBuilder(
      column: $state.table.rating,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get tags =>
      $state.composableBuilder(
          column: $state.table.tags,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get brand => $state.composableBuilder(
      column: $state.table.brand,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sku => $state.composableBuilder(
      column: $state.table.sku,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get dimensions =>
      $state.composableBuilder(
          column: $state.table.dimensions,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get warrantyInformation => $state.composableBuilder(
      column: $state.table.warrantyInformation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shippingInformation => $state.composableBuilder(
      column: $state.table.shippingInformation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get availabilityStatus => $state.composableBuilder(
      column: $state.table.availabilityStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get reviews =>
      $state.composableBuilder(
          column: $state.table.reviews,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get returnPolicy => $state.composableBuilder(
      column: $state.table.returnPolicy,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get minimumOrderQuantity => $state.composableBuilder(
      column: $state.table.minimumOrderQuantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get meta =>
      $state.composableBuilder(
          column: $state.table.meta,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<dynamic, dynamic, String> get images =>
      $state.composableBuilder(
          column: $state.table.images,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter productVariantGroupTableRefs(
      ComposableFilter Function($$ProductVariantGroupTableTableFilterComposer f)
          f) {
    final $$ProductVariantGroupTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.productVariantGroupTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantGroupTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantGroupTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ProductTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get discountPercentage => $state.composableBuilder(
      column: $state.table.discountPercentage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get rating => $state.composableBuilder(
      column: $state.table.rating,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get stock => $state.composableBuilder(
      column: $state.table.stock,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get brand => $state.composableBuilder(
      column: $state.table.brand,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sku => $state.composableBuilder(
      column: $state.table.sku,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get weight => $state.composableBuilder(
      column: $state.table.weight,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dimensions => $state.composableBuilder(
      column: $state.table.dimensions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get warrantyInformation => $state.composableBuilder(
      column: $state.table.warrantyInformation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shippingInformation => $state.composableBuilder(
      column: $state.table.shippingInformation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get availabilityStatus => $state.composableBuilder(
      column: $state.table.availabilityStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reviews => $state.composableBuilder(
      column: $state.table.reviews,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get returnPolicy => $state.composableBuilder(
      column: $state.table.returnPolicy,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get minimumOrderQuantity => $state.composableBuilder(
      column: $state.table.minimumOrderQuantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meta => $state.composableBuilder(
      column: $state.table.meta,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get images => $state.composableBuilder(
      column: $state.table.images,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProductVariantGroupTableTableCreateCompanionBuilder
    = ProductVariantGroupTableCompanion Function({
  Value<int> id,
  required String groupName,
  required int productId,
});
typedef $$ProductVariantGroupTableTableUpdateCompanionBuilder
    = ProductVariantGroupTableCompanion Function({
  Value<int> id,
  Value<String> groupName,
  Value<int> productId,
});

class $$ProductVariantGroupTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductVariantGroupTableTable,
    ProductVariantGroupTableData,
    $$ProductVariantGroupTableTableFilterComposer,
    $$ProductVariantGroupTableTableOrderingComposer,
    $$ProductVariantGroupTableTableCreateCompanionBuilder,
    $$ProductVariantGroupTableTableUpdateCompanionBuilder> {
  $$ProductVariantGroupTableTableTableManager(
      _$AppDatabase db, $ProductVariantGroupTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProductVariantGroupTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ProductVariantGroupTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> groupName = const Value.absent(),
            Value<int> productId = const Value.absent(),
          }) =>
              ProductVariantGroupTableCompanion(
            id: id,
            groupName: groupName,
            productId: productId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String groupName,
            required int productId,
          }) =>
              ProductVariantGroupTableCompanion.insert(
            id: id,
            groupName: groupName,
            productId: productId,
          ),
        ));
}

class $$ProductVariantGroupTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductVariantGroupTableTable> {
  $$ProductVariantGroupTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get groupName => $state.composableBuilder(
      column: $state.table.groupName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductTableTableFilterComposer get productId {
    final $$ProductTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.productTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductTableTableFilterComposer(ComposerState($state.db,
                $state.db.productTable, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter productVariantTableRefs(
      ComposableFilter Function($$ProductVariantTableTableFilterComposer f) f) {
    final $$ProductVariantTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.productVariantTable,
            getReferencedColumn: (t) => t.groupId,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$ProductVariantGroupTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductVariantGroupTableTable> {
  $$ProductVariantGroupTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get groupName => $state.composableBuilder(
      column: $state.table.groupName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductTableTableOrderingComposer get productId {
    final $$ProductTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.productTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductTableTableOrderingComposer(ComposerState($state.db,
                $state.db.productTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ProductVariantTableTableCreateCompanionBuilder
    = ProductVariantTableCompanion Function({
  Value<int> id,
  required String name,
  required int groupId,
});
typedef $$ProductVariantTableTableUpdateCompanionBuilder
    = ProductVariantTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> groupId,
});

class $$ProductVariantTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductVariantTableTable,
    ProductVariantTableData,
    $$ProductVariantTableTableFilterComposer,
    $$ProductVariantTableTableOrderingComposer,
    $$ProductVariantTableTableCreateCompanionBuilder,
    $$ProductVariantTableTableUpdateCompanionBuilder> {
  $$ProductVariantTableTableTableManager(
      _$AppDatabase db, $ProductVariantTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProductVariantTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ProductVariantTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> groupId = const Value.absent(),
          }) =>
              ProductVariantTableCompanion(
            id: id,
            name: name,
            groupId: groupId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int groupId,
          }) =>
              ProductVariantTableCompanion.insert(
            id: id,
            name: name,
            groupId: groupId,
          ),
        ));
}

class $$ProductVariantTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductVariantTableTable> {
  $$ProductVariantTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductVariantGroupTableTableFilterComposer get groupId {
    final $$ProductVariantGroupTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupId,
            referencedTable: $state.db.productVariantGroupTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantGroupTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantGroupTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  ComposableFilter orderItemVariantSelectionTableRefs(
      ComposableFilter Function(
              $$OrderItemVariantSelectionTableTableFilterComposer f)
          f) {
    final $$OrderItemVariantSelectionTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.orderItemVariantSelectionTable,
            getReferencedColumn: (t) => t.variantId,
            builder: (joinBuilder, parentComposers) =>
                $$OrderItemVariantSelectionTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.orderItemVariantSelectionTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$ProductVariantTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductVariantTableTable> {
  $$ProductVariantTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductVariantGroupTableTableOrderingComposer get groupId {
    final $$ProductVariantGroupTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.groupId,
            referencedTable: $state.db.productVariantGroupTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantGroupTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantGroupTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

typedef $$CartTableTableCreateCompanionBuilder = CartTableCompanion Function({
  Value<int> id,
});
typedef $$CartTableTableUpdateCompanionBuilder = CartTableCompanion Function({
  Value<int> id,
});

class $$CartTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartTableTable,
    CartTableData,
    $$CartTableTableFilterComposer,
    $$CartTableTableOrderingComposer,
    $$CartTableTableCreateCompanionBuilder,
    $$CartTableTableUpdateCompanionBuilder> {
  $$CartTableTableTableManager(_$AppDatabase db, $CartTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CartTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CartTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              CartTableCompanion(
            id: id,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
          }) =>
              CartTableCompanion.insert(
            id: id,
          ),
        ));
}

class $$CartTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CartTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$OrderItemTableTableCreateCompanionBuilder = OrderItemTableCompanion
    Function({
  Value<int> id,
  required int quantity,
});
typedef $$OrderItemTableTableUpdateCompanionBuilder = OrderItemTableCompanion
    Function({
  Value<int> id,
  Value<int> quantity,
});

class $$OrderItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemTableTable,
    OrderItemTableData,
    $$OrderItemTableTableFilterComposer,
    $$OrderItemTableTableOrderingComposer,
    $$OrderItemTableTableCreateCompanionBuilder,
    $$OrderItemTableTableUpdateCompanionBuilder> {
  $$OrderItemTableTableTableManager(
      _$AppDatabase db, $OrderItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrderItemTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrderItemTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> quantity = const Value.absent(),
          }) =>
              OrderItemTableCompanion(
            id: id,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int quantity,
          }) =>
              OrderItemTableCompanion.insert(
            id: id,
            quantity: quantity,
          ),
        ));
}

class $$OrderItemTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter cartItemTableRefs(
      ComposableFilter Function($$CartItemTableTableFilterComposer f) f) {
    final $$CartItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.cartItemTable,
        getReferencedColumn: (t) => t.orderItemId,
        builder: (joinBuilder, parentComposers) =>
            $$CartItemTableTableFilterComposer(ComposerState($state.db,
                $state.db.cartItemTable, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter orderItemVariantSelectionTableRefs(
      ComposableFilter Function(
              $$OrderItemVariantSelectionTableTableFilterComposer f)
          f) {
    final $$OrderItemVariantSelectionTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.orderItemVariantSelectionTable,
            getReferencedColumn: (t) => t.orderItemId,
            builder: (joinBuilder, parentComposers) =>
                $$OrderItemVariantSelectionTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.orderItemVariantSelectionTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$OrderItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CartItemTableTableCreateCompanionBuilder = CartItemTableCompanion
    Function({
  Value<bool> isIncludeInOrder,
  Value<int> orderItemId,
});
typedef $$CartItemTableTableUpdateCompanionBuilder = CartItemTableCompanion
    Function({
  Value<bool> isIncludeInOrder,
  Value<int> orderItemId,
});

class $$CartItemTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CartItemTableTable,
    CartItemTableData,
    $$CartItemTableTableFilterComposer,
    $$CartItemTableTableOrderingComposer,
    $$CartItemTableTableCreateCompanionBuilder,
    $$CartItemTableTableUpdateCompanionBuilder> {
  $$CartItemTableTableTableManager(_$AppDatabase db, $CartItemTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CartItemTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CartItemTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<bool> isIncludeInOrder = const Value.absent(),
            Value<int> orderItemId = const Value.absent(),
          }) =>
              CartItemTableCompanion(
            isIncludeInOrder: isIncludeInOrder,
            orderItemId: orderItemId,
          ),
          createCompanionCallback: ({
            Value<bool> isIncludeInOrder = const Value.absent(),
            Value<int> orderItemId = const Value.absent(),
          }) =>
              CartItemTableCompanion.insert(
            isIncludeInOrder: isIncludeInOrder,
            orderItemId: orderItemId,
          ),
        ));
}

class $$CartItemTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CartItemTableTable> {
  $$CartItemTableTableFilterComposer(super.$state);
  ColumnFilters<bool> get isIncludeInOrder => $state.composableBuilder(
      column: $state.table.isIncludeInOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$OrderItemTableTableFilterComposer get orderItemId {
    final $$OrderItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: $state.db.orderItemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$OrderItemTableTableFilterComposer(ComposerState($state.db,
                $state.db.orderItemTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CartItemTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CartItemTableTable> {
  $$CartItemTableTableOrderingComposer(super.$state);
  ColumnOrderings<bool> get isIncludeInOrder => $state.composableBuilder(
      column: $state.table.isIncludeInOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$OrderItemTableTableOrderingComposer get orderItemId {
    final $$OrderItemTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderItemId,
            referencedTable: $state.db.orderItemTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$OrderItemTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.orderItemTable, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$OrderItemVariantSelectionTableTableCreateCompanionBuilder
    = OrderItemVariantSelectionTableCompanion Function({
  required int orderItemId,
  required int variantId,
  Value<int> rowid,
});
typedef $$OrderItemVariantSelectionTableTableUpdateCompanionBuilder
    = OrderItemVariantSelectionTableCompanion Function({
  Value<int> orderItemId,
  Value<int> variantId,
  Value<int> rowid,
});

class $$OrderItemVariantSelectionTableTableTableManager
    extends RootTableManager<
        _$AppDatabase,
        $OrderItemVariantSelectionTableTable,
        OrderItemVariantSelectionTableData,
        $$OrderItemVariantSelectionTableTableFilterComposer,
        $$OrderItemVariantSelectionTableTableOrderingComposer,
        $$OrderItemVariantSelectionTableTableCreateCompanionBuilder,
        $$OrderItemVariantSelectionTableTableUpdateCompanionBuilder> {
  $$OrderItemVariantSelectionTableTableTableManager(
      _$AppDatabase db, $OrderItemVariantSelectionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrderItemVariantSelectionTableTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$OrderItemVariantSelectionTableTableOrderingComposer(
                  ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> orderItemId = const Value.absent(),
            Value<int> variantId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemVariantSelectionTableCompanion(
            orderItemId: orderItemId,
            variantId: variantId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int orderItemId,
            required int variantId,
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemVariantSelectionTableCompanion.insert(
            orderItemId: orderItemId,
            variantId: variantId,
            rowid: rowid,
          ),
        ));
}

class $$OrderItemVariantSelectionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase,
        $OrderItemVariantSelectionTableTable> {
  $$OrderItemVariantSelectionTableTableFilterComposer(super.$state);
  $$OrderItemTableTableFilterComposer get orderItemId {
    final $$OrderItemTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: $state.db.orderItemTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$OrderItemTableTableFilterComposer(ComposerState($state.db,
                $state.db.orderItemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProductVariantTableTableFilterComposer get variantId {
    final $$ProductVariantTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.variantId,
            referencedTable: $state.db.productVariantTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$OrderItemVariantSelectionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $OrderItemVariantSelectionTableTable> {
  $$OrderItemVariantSelectionTableTableOrderingComposer(super.$state);
  $$OrderItemTableTableOrderingComposer get orderItemId {
    final $$OrderItemTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderItemId,
            referencedTable: $state.db.orderItemTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$OrderItemTableTableOrderingComposer(ComposerState($state.db,
                    $state.db.orderItemTable, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProductVariantTableTableOrderingComposer get variantId {
    final $$ProductVariantTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.variantId,
            referencedTable: $state.db.productVariantTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$ProductVariantTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.productVariantTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$ProductVariantGroupTableTableTableManager get productVariantGroupTable =>
      $$ProductVariantGroupTableTableTableManager(
          _db, _db.productVariantGroupTable);
  $$ProductVariantTableTableTableManager get productVariantTable =>
      $$ProductVariantTableTableTableManager(_db, _db.productVariantTable);
  $$CartTableTableTableManager get cartTable =>
      $$CartTableTableTableManager(_db, _db.cartTable);
  $$OrderItemTableTableTableManager get orderItemTable =>
      $$OrderItemTableTableTableManager(_db, _db.orderItemTable);
  $$CartItemTableTableTableManager get cartItemTable =>
      $$CartItemTableTableTableManager(_db, _db.cartItemTable);
  $$OrderItemVariantSelectionTableTableTableManager
      get orderItemVariantSelectionTable =>
          $$OrderItemVariantSelectionTableTableTableManager(
              _db, _db.orderItemVariantSelectionTable);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driftHash() => r'9cef6c38693edc053e164e578a2f62f384244eed';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [drift].
@ProviderFor(drift)
const driftProvider = DriftFamily();

/// See also [drift].
class DriftFamily extends Family<AsyncValue<AppDatabase>> {
  /// See also [drift].
  const DriftFamily();

  /// See also [drift].
  DriftProvider call({
    String dbName = 'default',
  }) {
    return DriftProvider(
      dbName: dbName,
    );
  }

  @override
  DriftProvider getProviderOverride(
    covariant DriftProvider provider,
  ) {
    return call(
      dbName: provider.dbName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'driftProvider';
}

/// See also [drift].
class DriftProvider extends FutureProvider<AppDatabase> {
  /// See also [drift].
  DriftProvider({
    String dbName = 'default',
  }) : this._internal(
          (ref) => drift(
            ref as DriftRef,
            dbName: dbName,
          ),
          from: driftProvider,
          name: r'driftProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$driftHash,
          dependencies: DriftFamily._dependencies,
          allTransitiveDependencies: DriftFamily._allTransitiveDependencies,
          dbName: dbName,
        );

  DriftProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbName,
  }) : super.internal();

  final String dbName;

  @override
  Override overrideWith(
    FutureOr<AppDatabase> Function(DriftRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DriftProvider._internal(
        (ref) => create(ref as DriftRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbName: dbName,
      ),
    );
  }

  @override
  FutureProviderElement<AppDatabase> createElement() {
    return _DriftProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DriftProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DriftRef on FutureProviderRef<AppDatabase> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _DriftProviderElement extends FutureProviderElement<AppDatabase>
    with DriftRef {
  _DriftProviderElement(super.provider);

  @override
  String get dbName => (origin as DriftProvider).dbName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
