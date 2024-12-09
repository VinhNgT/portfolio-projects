// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.drift.dart'
    as i2;
import 'package:e_commerce/features/products/data/drift_tables/product_variant_group_table.dart'
    as i3;
import 'package:e_commerce/features/products/data/drift_tables/product_table.drift.dart'
    as i4;
import 'package:drift/internal/modular.dart' as i5;

typedef $$ProductVariantGroupTableTableCreateCompanionBuilder
    = i2.ProductVariantGroupTableCompanion Function({
  i0.Value<int> id,
  required String groupName,
  required int productId,
});
typedef $$ProductVariantGroupTableTableUpdateCompanionBuilder
    = i2.ProductVariantGroupTableCompanion Function({
  i0.Value<int> id,
  i0.Value<String> groupName,
  i0.Value<int> productId,
});

class $$ProductVariantGroupTableTableFilterComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$ProductVariantGroupTableTable> {
  $$ProductVariantGroupTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnFilters(column));

  i0.ColumnFilters<String> get groupName => $composableBuilder(
      column: $table.groupName, builder: (column) => i0.ColumnFilters(column));

  i4.$$ProductTableTableFilterComposer get productId {
    final i4.$$ProductTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: i5.ReadDatabaseContainer($db)
            .resultSet<i4.$ProductTableTable>('product_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i4.$$ProductTableTableFilterComposer(
              $db: $db,
              $table: i5.ReadDatabaseContainer($db)
                  .resultSet<i4.$ProductTableTable>('product_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantGroupTableTableOrderingComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$ProductVariantGroupTableTable> {
  $$ProductVariantGroupTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => i0.ColumnOrderings(column));

  i0.ColumnOrderings<String> get groupName => $composableBuilder(
      column: $table.groupName,
      builder: (column) => i0.ColumnOrderings(column));

  i4.$$ProductTableTableOrderingComposer get productId {
    final i4.$$ProductTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: i5.ReadDatabaseContainer($db)
            .resultSet<i4.$ProductTableTable>('product_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i4.$$ProductTableTableOrderingComposer(
              $db: $db,
              $table: i5.ReadDatabaseContainer($db)
                  .resultSet<i4.$ProductTableTable>('product_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantGroupTableTableAnnotationComposer extends i0
    .Composer<i0.GeneratedDatabase, i2.$ProductVariantGroupTableTable> {
  $$ProductVariantGroupTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  i0.GeneratedColumn<String> get groupName =>
      $composableBuilder(column: $table.groupName, builder: (column) => column);

  i4.$$ProductTableTableAnnotationComposer get productId {
    final i4.$$ProductTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: i5.ReadDatabaseContainer($db)
            .resultSet<i4.$ProductTableTable>('product_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i4.$$ProductTableTableAnnotationComposer(
              $db: $db,
              $table: i5.ReadDatabaseContainer($db)
                  .resultSet<i4.$ProductTableTable>('product_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductVariantGroupTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$ProductVariantGroupTableTable,
    i2.ProductVariantGroupTableData,
    i2.$$ProductVariantGroupTableTableFilterComposer,
    i2.$$ProductVariantGroupTableTableOrderingComposer,
    i2.$$ProductVariantGroupTableTableAnnotationComposer,
    $$ProductVariantGroupTableTableCreateCompanionBuilder,
    $$ProductVariantGroupTableTableUpdateCompanionBuilder,
    (
      i2.ProductVariantGroupTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$ProductVariantGroupTableTable,
          i2.ProductVariantGroupTableData>
    ),
    i2.ProductVariantGroupTableData,
    i0.PrefetchHooks Function({bool productId})> {
  $$ProductVariantGroupTableTableTableManager(
      i0.GeneratedDatabase db, i2.$ProductVariantGroupTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$ProductVariantGroupTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$ProductVariantGroupTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$ProductVariantGroupTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            i0.Value<String> groupName = const i0.Value.absent(),
            i0.Value<int> productId = const i0.Value.absent(),
          }) =>
              i2.ProductVariantGroupTableCompanion(
            id: id,
            groupName: groupName,
            productId: productId,
          ),
          createCompanionCallback: ({
            i0.Value<int> id = const i0.Value.absent(),
            required String groupName,
            required int productId,
          }) =>
              i2.ProductVariantGroupTableCompanion.insert(
            id: id,
            groupName: groupName,
            productId: productId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductVariantGroupTableTableProcessedTableManager
    = i0.ProcessedTableManager<
        i0.GeneratedDatabase,
        i2.$ProductVariantGroupTableTable,
        i2.ProductVariantGroupTableData,
        i2.$$ProductVariantGroupTableTableFilterComposer,
        i2.$$ProductVariantGroupTableTableOrderingComposer,
        i2.$$ProductVariantGroupTableTableAnnotationComposer,
        $$ProductVariantGroupTableTableCreateCompanionBuilder,
        $$ProductVariantGroupTableTableUpdateCompanionBuilder,
        (
          i2.ProductVariantGroupTableData,
          i0.BaseReferences<
              i0.GeneratedDatabase,
              i2.$ProductVariantGroupTableTable,
              i2.ProductVariantGroupTableData>
        ),
        i2.ProductVariantGroupTableData,
        i0.PrefetchHooks Function({bool productId})>;
mixin $ProductVariantGroupTableDaoMixin
    on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $ProductVariantGroupTableTable extends i3.ProductVariantGroupTable
    with
        i0.TableInfo<$ProductVariantGroupTableTable,
            i2.ProductVariantGroupTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductVariantGroupTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _idMeta = const i0.VerificationMeta('id');
  @override
  late final i0.GeneratedColumn<int> id = i0.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const i0.VerificationMeta _groupNameMeta =
      const i0.VerificationMeta('groupName');
  @override
  late final i0.GeneratedColumn<String> groupName = i0.GeneratedColumn<String>(
      'group_name', aliasedName, false,
      type: i0.DriftSqlType.string, requiredDuringInsert: true);
  static const i0.VerificationMeta _productIdMeta =
      const i0.VerificationMeta('productId');
  @override
  late final i0.GeneratedColumn<int> productId = i0.GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES product_table (id) ON DELETE CASCADE'));
  @override
  List<i0.GeneratedColumn> get $columns => [id, groupName, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_variant_group_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.ProductVariantGroupTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
  Set<i0.GeneratedColumn> get $primaryKey => {id};
  @override
  i2.ProductVariantGroupTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.ProductVariantGroupTableData(
      id: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}id'])!,
      groupName: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.string, data['${effectivePrefix}group_name'])!,
      productId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $ProductVariantGroupTableTable createAlias(String alias) {
    return $ProductVariantGroupTableTable(attachedDatabase, alias);
  }
}

class ProductVariantGroupTableData extends i0.DataClass
    implements i0.Insertable<i2.ProductVariantGroupTableData> {
  final int id;
  final String groupName;
  final int productId;
  const ProductVariantGroupTableData(
      {required this.id, required this.groupName, required this.productId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['id'] = i0.Variable<int>(id);
    map['group_name'] = i0.Variable<String>(groupName);
    map['product_id'] = i0.Variable<int>(productId);
    return map;
  }

  i2.ProductVariantGroupTableCompanion toCompanion(bool nullToAbsent) {
    return i2.ProductVariantGroupTableCompanion(
      id: i0.Value(id),
      groupName: i0.Value(groupName),
      productId: i0.Value(productId),
    );
  }

  factory ProductVariantGroupTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ProductVariantGroupTableData(
      id: serializer.fromJson<int>(json['id']),
      groupName: serializer.fromJson<String>(json['groupName']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupName': serializer.toJson<String>(groupName),
      'productId': serializer.toJson<int>(productId),
    };
  }

  i2.ProductVariantGroupTableData copyWith(
          {int? id, String? groupName, int? productId}) =>
      i2.ProductVariantGroupTableData(
        id: id ?? this.id,
        groupName: groupName ?? this.groupName,
        productId: productId ?? this.productId,
      );
  ProductVariantGroupTableData copyWithCompanion(
      i2.ProductVariantGroupTableCompanion data) {
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
      (other is i2.ProductVariantGroupTableData &&
          other.id == this.id &&
          other.groupName == this.groupName &&
          other.productId == this.productId);
}

class ProductVariantGroupTableCompanion
    extends i0.UpdateCompanion<i2.ProductVariantGroupTableData> {
  final i0.Value<int> id;
  final i0.Value<String> groupName;
  final i0.Value<int> productId;
  const ProductVariantGroupTableCompanion({
    this.id = const i0.Value.absent(),
    this.groupName = const i0.Value.absent(),
    this.productId = const i0.Value.absent(),
  });
  ProductVariantGroupTableCompanion.insert({
    this.id = const i0.Value.absent(),
    required String groupName,
    required int productId,
  })  : groupName = i0.Value(groupName),
        productId = i0.Value(productId);
  static i0.Insertable<i2.ProductVariantGroupTableData> custom({
    i0.Expression<int>? id,
    i0.Expression<String>? groupName,
    i0.Expression<int>? productId,
  }) {
    return i0.RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupName != null) 'group_name': groupName,
      if (productId != null) 'product_id': productId,
    });
  }

  i2.ProductVariantGroupTableCompanion copyWith(
      {i0.Value<int>? id,
      i0.Value<String>? groupName,
      i0.Value<int>? productId}) {
    return i2.ProductVariantGroupTableCompanion(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (id.present) {
      map['id'] = i0.Variable<int>(id.value);
    }
    if (groupName.present) {
      map['group_name'] = i0.Variable<String>(groupName.value);
    }
    if (productId.present) {
      map['product_id'] = i0.Variable<int>(productId.value);
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
