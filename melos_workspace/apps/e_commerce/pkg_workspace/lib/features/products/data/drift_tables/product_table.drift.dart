// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/products/data/drift_tables/product_table.drift.dart'
    as i2;
import 'package:e_commerce/features/products/data/drift_tables/product_table.dart'
    as i3;

typedef $$ProductTableTableCreateCompanionBuilder = i2.ProductTableCompanion
    Function({
  i0.Value<int> id,
  required String title,
  required String description,
  required String category,
  required double price,
  required double discountPercentage,
  required double rating,
  required int stock,
  required dynamic tags,
  i0.Value<String?> brand,
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
typedef $$ProductTableTableUpdateCompanionBuilder = i2.ProductTableCompanion
    Function({
  i0.Value<int> id,
  i0.Value<String> title,
  i0.Value<String> description,
  i0.Value<String> category,
  i0.Value<double> price,
  i0.Value<double> discountPercentage,
  i0.Value<double> rating,
  i0.Value<int> stock,
  i0.Value<dynamic> tags,
  i0.Value<String?> brand,
  i0.Value<String> sku,
  i0.Value<int> weight,
  i0.Value<dynamic> dimensions,
  i0.Value<String> warrantyInformation,
  i0.Value<String> shippingInformation,
  i0.Value<String> availabilityStatus,
  i0.Value<dynamic> reviews,
  i0.Value<String> returnPolicy,
  i0.Value<int> minimumOrderQuantity,
  i0.Value<dynamic> meta,
  i0.Value<String> thumbnail,
  i0.Value<dynamic> images,
});

class $$ProductTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductTableTable> {
  $$ProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<dynamic, dynamic, String> get tags =>
      $composableBuilder(
          column: $table.tags,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<dynamic, dynamic, String> get dimensions =>
      $composableBuilder(
          column: $table.dimensions,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get warrantyInformation => $composableBuilder(
      column: $table.warrantyInformation,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get shippingInformation => $composableBuilder(
      column: $table.shippingInformation,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get availabilityStatus => $composableBuilder(
      column: $table.availabilityStatus,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<dynamic, dynamic, String> get reviews =>
      $composableBuilder(
          column: $table.reviews,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get returnPolicy => $composableBuilder(
      column: $table.returnPolicy,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<int> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity,
      builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<dynamic, dynamic, String> get meta =>
      $composableBuilder(
          column: $table.meta,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));

  i0.ColumnFilters<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnWithTypeConverterFilters<dynamic, dynamic, String> get images =>
      $composableBuilder(
          column: $table.images,
          builder: (column) => i0.ColumnWithTypeConverterFilters(column));
}

class $$ProductTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductTableTable> {
  $$ProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get stock => $composableBuilder(
      column: $table.stock, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get dimensions => $composableBuilder(
      column: $table.dimensions,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get warrantyInformation => $composableBuilder(
      column: $table.warrantyInformation,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get shippingInformation => $composableBuilder(
      column: $table.shippingInformation,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get availabilityStatus => $composableBuilder(
      column: $table.availabilityStatus,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get reviews => $composableBuilder(
      column: $table.reviews, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get returnPolicy => $composableBuilder(
      column: $table.returnPolicy,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<int> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get meta => $composableBuilder(
      column: $table.meta, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail,
      builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get images => $composableBuilder(
      column: $table.images, builder: (column) => i0.ColumnOrderings(column));
}

class $$ProductTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  i0.GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  i0.GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  i0.GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  i0.GeneratedColumn<double> get discountPercentage => $composableBuilder(
      column: $table.discountPercentage, builder: (column) => column);

  i0.GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  i0.GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<dynamic, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  i0.GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  i0.GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  i0.GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<dynamic, String> get dimensions =>
      $composableBuilder(
          column: $table.dimensions, builder: (column) => column);

  i0.GeneratedColumn<String> get warrantyInformation => $composableBuilder(
      column: $table.warrantyInformation, builder: (column) => column);

  i0.GeneratedColumn<String> get shippingInformation => $composableBuilder(
      column: $table.shippingInformation, builder: (column) => column);

  i0.GeneratedColumn<String> get availabilityStatus => $composableBuilder(
      column: $table.availabilityStatus, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<dynamic, String> get reviews =>
      $composableBuilder(column: $table.reviews, builder: (column) => column);

  i0.GeneratedColumn<String> get returnPolicy => $composableBuilder(
      column: $table.returnPolicy, builder: (column) => column);

  i0.GeneratedColumn<int> get minimumOrderQuantity => $composableBuilder(
      column: $table.minimumOrderQuantity, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<dynamic, String> get meta =>
      $composableBuilder(column: $table.meta, builder: (column) => column);

  i0.GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<dynamic, String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);
}

class $$ProductTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$ProductTableTable,
    i2.ProductTableData,
    i2.$$ProductTableTableFilterComposer,
    i2.$$ProductTableTableOrderingComposer,
    i2.$$ProductTableTableAnnotationComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (
      i2.ProductTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$ProductTableTable,
          i2.ProductTableData>
    ),
    i2.ProductTableData,
    i0.PrefetchHooks Function()> {
  $$ProductTableTableTableManager(
      i0.GeneratedDatabase db, i2.$ProductTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> title = const i0.Value.absent(),
            i0.Value<String> description = const i0.Value.absent(),
            i0.Value<String> category = const i0.Value.absent(),
            i0.Value<double> price = const i0.Value.absent(),
            i0.Value<double> discountPercentage = const i0.Value.absent(),
            i0.Value<double> rating = const i0.Value.absent(),
            i0.Value<int> stock = const i0.Value.absent(),
            i0.Value<dynamic> tags = const i0.Value.absent(),
            i0.Value<String?> brand = const i0.Value.absent(),
            i0.Value<String> sku = const i0.Value.absent(),
            i0.Value<int> weight = const i0.Value.absent(),
            i0.Value<dynamic> dimensions = const i0.Value.absent(),
            i0.Value<String> warrantyInformation = const i0.Value.absent(),
            i0.Value<String> shippingInformation = const i0.Value.absent(),
            i0.Value<String> availabilityStatus = const i0.Value.absent(),
            i0.Value<dynamic> reviews = const i0.Value.absent(),
            i0.Value<String> returnPolicy = const i0.Value.absent(),
            i0.Value<int> minimumOrderQuantity = const i0.Value.absent(),
            i0.Value<dynamic> meta = const i0.Value.absent(),
            i0.Value<String> thumbnail = const i0.Value.absent(),
            i0.Value<dynamic> images = const i0.Value.absent(),
          }) =>
              i2.ProductTableCompanion(
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
            i0.Value<int> id = const i0.Value.absent(),
            required String title,
            required String description,
            required String category,
            required double price,
            required double discountPercentage,
            required double rating,
            required int stock,
            required dynamic tags,
            i0.Value<String?> brand = const i0.Value.absent(),
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
              i2.ProductTableCompanion.insert(
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
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.$ProductTableTable,
    i2.ProductTableData,
    i2.$$ProductTableTableFilterComposer,
    i2.$$ProductTableTableOrderingComposer,
    i2.$$ProductTableTableAnnotationComposer,
    $$ProductTableTableCreateCompanionBuilder,
    $$ProductTableTableUpdateCompanionBuilder,
    (
      i2.ProductTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$ProductTableTable,
          i2.ProductTableData>
    ),
    i2.ProductTableData,
    i0.PrefetchHooks Function()>;
mixin $ProductTableDaoMixin on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $ProductTableTable extends i3.ProductTable
    with i0.TableInfo<$ProductTableTable, i2.ProductTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _titleMeta =
      const i0.VerificationMeta('title');
  @override
  late final i0.GeneratedColumn<String> title = i0.GeneratedColumn<String>(
      'title', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _descriptionMeta =
      const i0.VerificationMeta('description');
  @override
  late final i0.GeneratedColumn<String> description =
      i0.GeneratedColumn<String>('description', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _categoryMeta =
      const i0.VerificationMeta('category');
  @override
  late final i0.GeneratedColumn<String> category = i0.GeneratedColumn<String>(
      'category', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _priceMeta =
      const i0.VerificationMeta('price');
  @override
  late final i0.GeneratedColumn<double> price = i0.GeneratedColumn<double>(
      'price', aliasedName, false,
      type: i0.DriftSqlType.double, requiredDuringInsert: true);
  static const i0.VerificationMeta _discountPercentageMeta =
      const i0.VerificationMeta('discountPercentage');
  @override
  late final i0.GeneratedColumn<double> discountPercentage =
      i0.GeneratedColumn<double>('discount_percentage', aliasedName, false,
          type: i0.DriftSqlType.double, requiredDuringInsert: true);
  static const i0.VerificationMeta _ratingMeta =
      const i0.VerificationMeta('rating');
  @override
  late final i0.GeneratedColumn<double> rating = i0.GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: i0.DriftSqlType.double, requiredDuringInsert: true);
  static const i0.VerificationMeta _stockMeta =
      const i0.VerificationMeta('stock');
  @override
  late final i0.GeneratedColumn<int> stock = i0.GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: i0.DriftSqlType.int, requiredDuringInsert: true);
  static const i0.VerificationMeta _tagsMeta =
      const i0.VerificationMeta('tags');
  @override
  late final i0.GeneratedColumnWithTypeConverter<dynamic, String> tags =
      i0.GeneratedColumn<String>('tags', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>(i2.$ProductTableTable.$convertertags);
  static const i0.VerificationMeta _brandMeta =
      const i0.VerificationMeta('brand');
  @override
  late final i0.GeneratedColumn<String> brand = i0.GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: i0.DriftSqlType.string, requiredDuringInsert: false);
  static const i0.VerificationMeta _skuMeta = const i0.VerificationMeta('sku');
  @override
  late final i0.GeneratedColumn<String> sku = i0.GeneratedColumn<String>(
      'sku', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _weightMeta =
      const i0.VerificationMeta('weight');
  @override
  late final i0.GeneratedColumn<int> weight = i0.GeneratedColumn<int>(
      'weight', aliasedName, false,
      type: i0.DriftSqlType.int, requiredDuringInsert: true);
  static const i0.VerificationMeta _dimensionsMeta =
      const i0.VerificationMeta('dimensions');
  @override
  late final i0.GeneratedColumnWithTypeConverter<dynamic, String> dimensions =
      i0.GeneratedColumn<String>('dimensions', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>(i2.$ProductTableTable.$converterdimensions);
  static const i0.VerificationMeta _warrantyInformationMeta =
      const i0.VerificationMeta('warrantyInformation');
  @override
  late final i0.GeneratedColumn<String> warrantyInformation =
      i0.GeneratedColumn<String>('warranty_information', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _shippingInformationMeta =
      const i0.VerificationMeta('shippingInformation');
  @override
  late final i0.GeneratedColumn<String> shippingInformation =
      i0.GeneratedColumn<String>('shipping_information', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _availabilityStatusMeta =
      const i0.VerificationMeta('availabilityStatus');
  @override
  late final i0.GeneratedColumn<String> availabilityStatus =
      i0.GeneratedColumn<String>('availability_status', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _reviewsMeta =
      const i0.VerificationMeta('reviews');
  @override
  late final i0.GeneratedColumnWithTypeConverter<dynamic, String> reviews =
      i0.GeneratedColumn<String>('reviews', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>(i2.$ProductTableTable.$converterreviews);
  static const i0.VerificationMeta _returnPolicyMeta =
      const i0.VerificationMeta('returnPolicy');
  @override
  late final i0.GeneratedColumn<String> returnPolicy =
      i0.GeneratedColumn<String>('return_policy', aliasedName, false,
          type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _minimumOrderQuantityMeta =
      const i0.VerificationMeta('minimumOrderQuantity');
  @override
  late final i0.GeneratedColumn<int> minimumOrderQuantity =
      i0.GeneratedColumn<int>('minimum_order_quantity', aliasedName, false,
          type: i0.DriftSqlType.int, requiredDuringInsert: true);
  static const i0.VerificationMeta _metaMeta =
      const i0.VerificationMeta('meta');
  @override
  late final i0.GeneratedColumnWithTypeConverter<dynamic, String> meta =
      i0.GeneratedColumn<String>('meta', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>(i2.$ProductTableTable.$convertermeta);
  static const i0.VerificationMeta _thumbnailMeta =
      const i0.VerificationMeta('thumbnail');
  @override
  late final i0.GeneratedColumn<String> thumbnail = i0.GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _imagesMeta =
      const i0.VerificationMeta('images');
  @override
  late final i0.GeneratedColumnWithTypeConverter<dynamic, String> images =
      i0.GeneratedColumn<String>('images', aliasedName, false,
              type: i0.DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<dynamic>(i2.$ProductTableTable.$converterimages);
  @override
  List<i0.GeneratedColumn> get $columns => [
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
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.ProductTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
    context.handle(_tagsMeta, const i0.VerificationResult.success());
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
    context.handle(_dimensionsMeta, const i0.VerificationResult.success());
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
    context.handle(_reviewsMeta, const i0.VerificationResult.success());
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
    context.handle(_metaMeta, const i0.VerificationResult.success());
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    context.handle(_imagesMeta, const i0.VerificationResult.success());
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.ProductTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}category'])!,
      price: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.double, data['${effectivePrefix}price'])!,
      discountPercentage: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.double,
          data['${effectivePrefix}discount_percentage'])!,
      rating: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.double, data['${effectivePrefix}rating'])!,
      stock: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}stock'])!,
      tags: i2.$ProductTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}tags'])!),
      brand: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}brand']),
      sku: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}sku'])!,
      weight: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}weight'])!,
      dimensions: i2.$ProductTableTable.$converterdimensions.fromSql(
          attachedDatabase.typeMapping.read(
              i0.DriftSqlType.string, data['${effectivePrefix}dimensions'])!),
      warrantyInformation: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}warranty_information'])!,
      shippingInformation: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}shipping_information'])!,
      availabilityStatus: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}availability_status'])!,
      reviews: i2.$ProductTableTable.$converterreviews.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}reviews'])!),
      returnPolicy: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string, data['${effectivePrefix}return_policy'])!,
      minimumOrderQuantity: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.int,
          data['${effectivePrefix}minimum_order_quantity'])!,
      meta: i2.$ProductTableTable.$convertermeta.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}meta'])!),
      thumbnail: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
      images: i2.$ProductTableTable.$converterimages.fromSql(attachedDatabase
          .typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}images'])!),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }

  static i0.TypeConverter<dynamic, String> $convertertags =
      const i1.DbJsonConverter();
  static i0.TypeConverter<dynamic, String> $converterdimensions =
      const i1.DbJsonConverter();
  static i0.TypeConverter<dynamic, String> $converterreviews =
      const i1.DbJsonConverter();
  static i0.TypeConverter<dynamic, String> $convertermeta =
      const i1.DbJsonConverter();
  static i0.TypeConverter<dynamic, String> $converterimages =
      const i1.DbJsonConverter();
}

class ProductTableData extends i0.DataClass
    implements i0.Insertable<i2.ProductTableData> {
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['title'] = i0.Variable<String>(title);
    map['description'] = i0.Variable<String>(description);
    map['category'] = i0.Variable<String>(category);
    map['price'] = i0.Variable<double>(price);
    map['discount_percentage'] = i0.Variable<double>(discountPercentage);
    map['rating'] = i0.Variable<double>(rating);
    map['stock'] = i0.Variable<int>(stock);
    if (!nullToAbsent || tags != null) {
      map['tags'] =
          i0.Variable<String>(i2.$ProductTableTable.$convertertags.toSql(tags));
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = i0.Variable<String>(brand);
    }
    map['sku'] = i0.Variable<String>(sku);
    map['weight'] = i0.Variable<int>(weight);
    if (!nullToAbsent || dimensions != null) {
      map['dimensions'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterdimensions.toSql(dimensions));
    }
    map['warranty_information'] = i0.Variable<String>(warrantyInformation);
    map['shipping_information'] = i0.Variable<String>(shippingInformation);
    map['availability_status'] = i0.Variable<String>(availabilityStatus);
    if (!nullToAbsent || reviews != null) {
      map['reviews'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterreviews.toSql(reviews));
    }
    map['return_policy'] = i0.Variable<String>(returnPolicy);
    map['minimum_order_quantity'] = i0.Variable<int>(minimumOrderQuantity);
    if (!nullToAbsent || meta != null) {
      map['meta'] =
          i0.Variable<String>(i2.$ProductTableTable.$convertermeta.toSql(meta));
    }
    map['thumbnail'] = i0.Variable<String>(thumbnail);
    if (!nullToAbsent || images != null) {
      map['images'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterimages.toSql(images));
    }
    return map;
  }

  i2.ProductTableCompanion toCompanion(bool nullToAbsent) {
    return i2.ProductTableCompanion(
      id: i0.Value(id),
      title: i0.Value(title),
      description: i0.Value(description),
      category: i0.Value(category),
      price: i0.Value(price),
      discountPercentage: i0.Value(discountPercentage),
      rating: i0.Value(rating),
      stock: i0.Value(stock),
      tags: tags == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(tags),
      brand: brand == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(brand),
      sku: i0.Value(sku),
      weight: i0.Value(weight),
      dimensions: dimensions == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(dimensions),
      warrantyInformation: i0.Value(warrantyInformation),
      shippingInformation: i0.Value(shippingInformation),
      availabilityStatus: i0.Value(availabilityStatus),
      reviews: reviews == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(reviews),
      returnPolicy: i0.Value(returnPolicy),
      minimumOrderQuantity: i0.Value(minimumOrderQuantity),
      meta: meta == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(meta),
      thumbnail: i0.Value(thumbnail),
      images: images == null && nullToAbsent
          ? const i0.Value.absent()
          : i0.Value(images),
    );
  }

  factory ProductTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
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

  i2.ProductTableData copyWith(
          {int? id,
          String? title,
          String? description,
          String? category,
          double? price,
          double? discountPercentage,
          double? rating,
          int? stock,
          i0.Value<dynamic> tags = const i0.Value.absent(),
          i0.Value<String?> brand = const i0.Value.absent(),
          String? sku,
          int? weight,
          i0.Value<dynamic> dimensions = const i0.Value.absent(),
          String? warrantyInformation,
          String? shippingInformation,
          String? availabilityStatus,
          i0.Value<dynamic> reviews = const i0.Value.absent(),
          String? returnPolicy,
          int? minimumOrderQuantity,
          i0.Value<dynamic> meta = const i0.Value.absent(),
          String? thumbnail,
          i0.Value<dynamic> images = const i0.Value.absent()}) =>
      i2.ProductTableData(
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
  ProductTableData copyWithCompanion(i2.ProductTableCompanion data) {
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
      (other is i2.ProductTableData &&
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

class ProductTableCompanion extends i0.UpdateCompanion<i2.ProductTableData> {
  final i0.Value<int> id;
  final i0.Value<String> title;
  final i0.Value<String> description;
  final i0.Value<String> category;
  final i0.Value<double> price;
  final i0.Value<double> discountPercentage;
  final i0.Value<double> rating;
  final i0.Value<int> stock;
  final i0.Value<dynamic> tags;
  final i0.Value<String?> brand;
  final i0.Value<String> sku;
  final i0.Value<int> weight;
  final i0.Value<dynamic> dimensions;
  final i0.Value<String> warrantyInformation;
  final i0.Value<String> shippingInformation;
  final i0.Value<String> availabilityStatus;
  final i0.Value<dynamic> reviews;
  final i0.Value<String> returnPolicy;
  final i0.Value<int> minimumOrderQuantity;
  final i0.Value<dynamic> meta;
  final i0.Value<String> thumbnail;
  final i0.Value<dynamic> images;
  const ProductTableCompanion({
    this.id = const i0.Value.absent(),
    this.title = const i0.Value.absent(),
    this.description = const i0.Value.absent(),
    this.category = const i0.Value.absent(),
    this.price = const i0.Value.absent(),
    this.discountPercentage = const i0.Value.absent(),
    this.rating = const i0.Value.absent(),
    this.stock = const i0.Value.absent(),
    this.tags = const i0.Value.absent(),
    this.brand = const i0.Value.absent(),
    this.sku = const i0.Value.absent(),
    this.weight = const i0.Value.absent(),
    this.dimensions = const i0.Value.absent(),
    this.warrantyInformation = const i0.Value.absent(),
    this.shippingInformation = const i0.Value.absent(),
    this.availabilityStatus = const i0.Value.absent(),
    this.reviews = const i0.Value.absent(),
    this.returnPolicy = const i0.Value.absent(),
    this.minimumOrderQuantity = const i0.Value.absent(),
    this.meta = const i0.Value.absent(),
    this.thumbnail = const i0.Value.absent(),
    this.images = const i0.Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required String title,
    required String description,
    required String category,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    required dynamic tags,
    this.brand = const i0.Value.absent(),
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
  })  : title = i0.Value(title),
        description = i0.Value(description),
        category = i0.Value(category),
        price = i0.Value(price),
        discountPercentage = i0.Value(discountPercentage),
        rating = i0.Value(rating),
        stock = i0.Value(stock),
        tags = i0.Value(tags),
        sku = i0.Value(sku),
        weight = i0.Value(weight),
        dimensions = i0.Value(dimensions),
        warrantyInformation = i0.Value(warrantyInformation),
        shippingInformation = i0.Value(shippingInformation),
        availabilityStatus = i0.Value(availabilityStatus),
        reviews = i0.Value(reviews),
        returnPolicy = i0.Value(returnPolicy),
        minimumOrderQuantity = i0.Value(minimumOrderQuantity),
        meta = i0.Value(meta),
        thumbnail = i0.Value(thumbnail),
        images = i0.Value(images);
  static i0.Insertable<i2.ProductTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? title,
    i0.Expression<String>? description,
    i0.Expression<String>? category,
    i0.Expression<double>? price,
    i0.Expression<double>? discountPercentage,
    i0.Expression<double>? rating,
    i0.Expression<int>? stock,
    i0.Expression<String>? tags,
    i0.Expression<String>? brand,
    i0.Expression<String>? sku,
    i0.Expression<int>? weight,
    i0.Expression<String>? dimensions,
    i0.Expression<String>? warrantyInformation,
    i0.Expression<String>? shippingInformation,
    i0.Expression<String>? availabilityStatus,
    i0.Expression<String>? reviews,
    i0.Expression<String>? returnPolicy,
    i0.Expression<int>? minimumOrderQuantity,
    i0.Expression<String>? meta,
    i0.Expression<String>? thumbnail,
    i0.Expression<String>? images,
  }) {
    return i0.RawValuesInsertable({
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

  i2.ProductTableCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? title,
      i0.Value<String>? description,
      i0.Value<String>? category,
      i0.Value<double>? price,
      i0.Value<double>? discountPercentage,
      i0.Value<double>? rating,
      i0.Value<int>? stock,
      i0.Value<dynamic>? tags,
      i0.Value<String?>? brand,
      i0.Value<String>? sku,
      i0.Value<int>? weight,
      i0.Value<dynamic>? dimensions,
      i0.Value<String>? warrantyInformation,
      i0.Value<String>? shippingInformation,
      i0.Value<String>? availabilityStatus,
      i0.Value<dynamic>? reviews,
      i0.Value<String>? returnPolicy,
      i0.Value<int>? minimumOrderQuantity,
      i0.Value<dynamic>? meta,
      i0.Value<String>? thumbnail,
      i0.Value<dynamic>? images}) {
    return i2.ProductTableCompanion(
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
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = i0.Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = i0.Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = i0.Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = i0.Variable<double>(price.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] =
          i0.Variable<double>(discountPercentage.value);
    }
    if (rating.present) {
      map['rating'] = i0.Variable<double>(rating.value);
    }
    if (stock.present) {
      map['stock'] = i0.Variable<int>(stock.value);
    }
    if (tags.present) {
      map['tags'] = i0.Variable<String>(
          i2.$ProductTableTable.$convertertags.toSql(tags.value));
    }
    if (brand.present) {
      map['brand'] = i0.Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = i0.Variable<String>(sku.value);
    }
    if (weight.present) {
      map['weight'] = i0.Variable<int>(weight.value);
    }
    if (dimensions.present) {
      map['dimensions'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterdimensions.toSql(dimensions.value));
    }
    if (warrantyInformation.present) {
      map['warranty_information'] =
          i0.Variable<String>(warrantyInformation.value);
    }
    if (shippingInformation.present) {
      map['shipping_information'] =
          i0.Variable<String>(shippingInformation.value);
    }
    if (availabilityStatus.present) {
      map['availability_status'] =
          i0.Variable<String>(availabilityStatus.value);
    }
    if (reviews.present) {
      map['reviews'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterreviews.toSql(reviews.value));
    }
    if (returnPolicy.present) {
      map['return_policy'] = i0.Variable<String>(returnPolicy.value);
    }
    if (minimumOrderQuantity.present) {
      map['minimum_order_quantity'] =
          i0.Variable<int>(minimumOrderQuantity.value);
    }
    if (meta.present) {
      map['meta'] = i0.Variable<String>(
          i2.$ProductTableTable.$convertermeta.toSql(meta.value));
    }
    if (thumbnail.present) {
      map['thumbnail'] = i0.Variable<String>(thumbnail.value);
    }
    if (images.present) {
      map['images'] = i0.Variable<String>(
          i2.$ProductTableTable.$converterimages.toSql(images.value));
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
