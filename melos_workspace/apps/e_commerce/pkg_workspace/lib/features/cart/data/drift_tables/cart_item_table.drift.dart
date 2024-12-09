// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:e_commerce/backend/database/drift_database_provider.dart' as i1;
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.drift.dart'
    as i2;
import 'package:e_commerce/features/cart/data/drift_tables/cart_item_table.dart'
    as i3;
import 'package:drift/src/runtime/query_builder/query_builder.dart' as i4;
import 'package:e_commerce/features/orders/data/drift_tables/order_item_table.drift.dart'
    as i5;
import 'package:drift/internal/modular.dart' as i6;
import 'package:e_commerce/features/cart/data/drift_tables/cart_table.drift.dart'
    as i7;

typedef $$CartItemTableTableCreateCompanionBuilder = i2.CartItemTableCompanion
    Function({
  i0.Value<bool> isIncludeInOrder,
  i0.Value<int> orderItemId,
  required int cartId,
});
typedef $$CartItemTableTableUpdateCompanionBuilder = i2.CartItemTableCompanion
    Function({
  i0.Value<bool> isIncludeInOrder,
  i0.Value<int> orderItemId,
  i0.Value<int> cartId,
});

class $$CartItemTableTableFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartItemTableTable> {
  $$CartItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnFilters<bool> get isIncludeInOrder => $composableBuilder(
      column: $table.isIncludeInOrder,
      builder: (column) => i0.ColumnFilters(column));

  i5.$$OrderItemTableTableFilterComposer get orderItemId {
    final i5.$$OrderItemTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i5.$OrderItemTableTable>('order_item_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i5.$$OrderItemTableTableFilterComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i5.$OrderItemTableTable>('order_item_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  i7.$$CartTableTableFilterComposer get cartId {
    final i7.$$CartTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i7.$CartTableTable>('cart_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i7.$$CartTableTableFilterComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i7.$CartTableTable>('cart_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemTableTableOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartItemTableTable> {
  $$CartItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<bool> get isIncludeInOrder => $composableBuilder(
      column: $table.isIncludeInOrder,
      builder: (column) => i0.ColumnOrderings(column));

  i5.$$OrderItemTableTableOrderingComposer get orderItemId {
    final i5.$$OrderItemTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderItemId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i5.$OrderItemTableTable>('order_item_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i5.$$OrderItemTableTableOrderingComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i5.$OrderItemTableTable>('order_item_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  i7.$$CartTableTableOrderingComposer get cartId {
    final i7.$$CartTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i7.$CartTableTable>('cart_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i7.$$CartTableTableOrderingComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i7.$CartTableTable>('cart_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemTableTableAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i2.$CartItemTableTable> {
  $$CartItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumn<bool> get isIncludeInOrder => $composableBuilder(
      column: $table.isIncludeInOrder, builder: (column) => column);

  i5.$$OrderItemTableTableAnnotationComposer get orderItemId {
    final i5.$$OrderItemTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.orderItemId,
            referencedTable: i6.ReadDatabaseContainer($db)
                .resultSet<i5.$OrderItemTableTable>('order_item_table'),
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                i5.$$OrderItemTableTableAnnotationComposer(
                  $db: $db,
                  $table: i6.ReadDatabaseContainer($db)
                      .resultSet<i5.$OrderItemTableTable>('order_item_table'),
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  i7.$$CartTableTableAnnotationComposer get cartId {
    final i7.$$CartTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cartId,
        referencedTable: i6.ReadDatabaseContainer($db)
            .resultSet<i7.$CartTableTable>('cart_table'),
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            i7.$$CartTableTableAnnotationComposer(
              $db: $db,
              $table: i6.ReadDatabaseContainer($db)
                  .resultSet<i7.$CartTableTable>('cart_table'),
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CartItemTableTableTableManager extends i0.RootTableManager<
    i0.GeneratedDatabase,
    i2.$CartItemTableTable,
    i2.CartItemTableData,
    i2.$$CartItemTableTableFilterComposer,
    i2.$$CartItemTableTableOrderingComposer,
    i2.$$CartItemTableTableAnnotationComposer,
    $$CartItemTableTableCreateCompanionBuilder,
    $$CartItemTableTableUpdateCompanionBuilder,
    (
      i2.CartItemTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$CartItemTableTable,
          i2.CartItemTableData>
    ),
    i2.CartItemTableData,
    i0.PrefetchHooks Function({bool orderItemId, bool cartId})> {
  $$CartItemTableTableTableManager(
      i0.GeneratedDatabase db, i2.$CartItemTableTable table)
      : super(i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i2.$$CartItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i2.$$CartItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i2.$$CartItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            i0.Value<bool> isIncludeInOrder = const i0.Value.absent(),
            i0.Value<int> orderItemId = const i0.Value.absent(),
            i0.Value<int> cartId = const i0.Value.absent(),
          }) =>
              i2.CartItemTableCompanion(
            isIncludeInOrder: isIncludeInOrder,
            orderItemId: orderItemId,
            cartId: cartId,
          ),
          createCompanionCallback: ({
            i0.Value<bool> isIncludeInOrder = const i0.Value.absent(),
            i0.Value<int> orderItemId = const i0.Value.absent(),
            required int cartId,
          }) =>
              i2.CartItemTableCompanion.insert(
            isIncludeInOrder: isIncludeInOrder,
            orderItemId: orderItemId,
            cartId: cartId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CartItemTableTableProcessedTableManager = i0.ProcessedTableManager<
    i0.GeneratedDatabase,
    i2.$CartItemTableTable,
    i2.CartItemTableData,
    i2.$$CartItemTableTableFilterComposer,
    i2.$$CartItemTableTableOrderingComposer,
    i2.$$CartItemTableTableAnnotationComposer,
    $$CartItemTableTableCreateCompanionBuilder,
    $$CartItemTableTableUpdateCompanionBuilder,
    (
      i2.CartItemTableData,
      i0.BaseReferences<i0.GeneratedDatabase, i2.$CartItemTableTable,
          i2.CartItemTableData>
    ),
    i2.CartItemTableData,
    i0.PrefetchHooks Function({bool orderItemId, bool cartId})>;
mixin $CartItemTableDaoMixin on i0.DatabaseAccessor<i1.DriftLocalDatabase> {}

class $CartItemTableTable extends i3.CartItemTable
    with i0.TableInfo<$CartItemTableTable, i2.CartItemTableData> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemTableTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _isIncludeInOrderMeta =
      const i0.VerificationMeta('isIncludeInOrder');
  @override
  late final i0.GeneratedColumn<bool> isIncludeInOrder =
      i0.GeneratedColumn<bool>('is_include_in_order', aliasedName, false,
          type: i0.DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
              'CHECK ("is_include_in_order" IN (0, 1))'),
          defaultValue: const i4.Constant(true));
  static const i0.VerificationMeta _orderItemIdMeta =
      const i0.VerificationMeta('orderItemId');
  @override
  late final i0.GeneratedColumn<int> orderItemId = i0.GeneratedColumn<int>(
      'order_item_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
          'REFERENCES order_item_table (id) ON DELETE CASCADE'));
  static const i0.VerificationMeta _cartIdMeta =
      const i0.VerificationMeta('cartId');
  @override
  late final i0.GeneratedColumn<int> cartId = i0.GeneratedColumn<int>(
      'cart_id', aliasedName, false,
      type: i0.DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          i0.GeneratedColumn.constraintIsAlways('REFERENCES cart_table (id)'));
  @override
  List<i0.GeneratedColumn> get $columns =>
      [isIncludeInOrder, orderItemId, cartId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_item_table';
  @override
  i0.VerificationContext validateIntegrity(
      i0.Insertable<i2.CartItemTableData> instance,
      {bool isInserting = false}) {
    final context = i0.VerificationContext();
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
    if (data.containsKey('cart_id')) {
      context.handle(_cartIdMeta,
          cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta));
    } else if (isInserting) {
      context.missing(_cartIdMeta);
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {orderItemId};
  @override
  i2.CartItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i2.CartItemTableData(
      isIncludeInOrder: attachedDatabase.typeMapping.read(
          i0.DriftSqlType.bool, data['${effectivePrefix}is_include_in_order'])!,
      orderItemId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}order_item_id'])!,
      cartId: attachedDatabase.typeMapping
          .read(i0.DriftSqlType.int, data['${effectivePrefix}cart_id'])!,
    );
  }

  @override
  $CartItemTableTable createAlias(String alias) {
    return $CartItemTableTable(attachedDatabase, alias);
  }
}

class CartItemTableData extends i0.DataClass
    implements i0.Insertable<i2.CartItemTableData> {
  final bool isIncludeInOrder;
  final int orderItemId;
  final int cartId;
  const CartItemTableData(
      {required this.isIncludeInOrder,
      required this.orderItemId,
      required this.cartId});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['is_include_in_order'] = i0.Variable<bool>(isIncludeInOrder);
    map['order_item_id'] = i0.Variable<int>(orderItemId);
    map['cart_id'] = i0.Variable<int>(cartId);
    return map;
  }

  i2.CartItemTableCompanion toCompanion(bool nullToAbsent) {
    return i2.CartItemTableCompanion(
      isIncludeInOrder: i0.Value(isIncludeInOrder),
      orderItemId: i0.Value(orderItemId),
      cartId: i0.Value(cartId),
    );
  }

  factory CartItemTableData.fromJson(Map<String, dynamic> json,
      {i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return CartItemTableData(
      isIncludeInOrder: serializer.fromJson<bool>(json['isIncludeInOrder']),
      orderItemId: serializer.fromJson<int>(json['orderItemId']),
      cartId: serializer.fromJson<int>(json['cartId']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'isIncludeInOrder': serializer.toJson<bool>(isIncludeInOrder),
      'orderItemId': serializer.toJson<int>(orderItemId),
      'cartId': serializer.toJson<int>(cartId),
    };
  }

  i2.CartItemTableData copyWith(
          {bool? isIncludeInOrder, int? orderItemId, int? cartId}) =>
      i2.CartItemTableData(
        isIncludeInOrder: isIncludeInOrder ?? this.isIncludeInOrder,
        orderItemId: orderItemId ?? this.orderItemId,
        cartId: cartId ?? this.cartId,
      );
  CartItemTableData copyWithCompanion(i2.CartItemTableCompanion data) {
    return CartItemTableData(
      isIncludeInOrder: data.isIncludeInOrder.present
          ? data.isIncludeInOrder.value
          : this.isIncludeInOrder,
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
      cartId: data.cartId.present ? data.cartId.value : this.cartId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTableData(')
          ..write('isIncludeInOrder: $isIncludeInOrder, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('cartId: $cartId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(isIncludeInOrder, orderItemId, cartId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i2.CartItemTableData &&
          other.isIncludeInOrder == this.isIncludeInOrder &&
          other.orderItemId == this.orderItemId &&
          other.cartId == this.cartId);
}

class CartItemTableCompanion extends i0.UpdateCompanion<i2.CartItemTableData> {
  final i0.Value<bool> isIncludeInOrder;
  final i0.Value<int> orderItemId;
  final i0.Value<int> cartId;
  const CartItemTableCompanion({
    this.isIncludeInOrder = const i0.Value.absent(),
    this.orderItemId = const i0.Value.absent(),
    this.cartId = const i0.Value.absent(),
  });
  CartItemTableCompanion.insert({
    this.isIncludeInOrder = const i0.Value.absent(),
    this.orderItemId = const i0.Value.absent(),
    required int cartId,
  }) : cartId = i0.Value(cartId);
  static i0.Insertable<i2.CartItemTableData> custom({
    i0.Expression<bool>? isIncludeInOrder,
    i0.Expression<int>? orderItemId,
    i0.Expression<int>? cartId,
  }) {
    return i0.RawValuesInsertable({
      if (isIncludeInOrder != null) 'is_include_in_order': isIncludeInOrder,
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (cartId != null) 'cart_id': cartId,
    });
  }

  i2.CartItemTableCompanion copyWith(
      {i0.Value<bool>? isIncludeInOrder,
      i0.Value<int>? orderItemId,
      i0.Value<int>? cartId}) {
    return i2.CartItemTableCompanion(
      isIncludeInOrder: isIncludeInOrder ?? this.isIncludeInOrder,
      orderItemId: orderItemId ?? this.orderItemId,
      cartId: cartId ?? this.cartId,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (isIncludeInOrder.present) {
      map['is_include_in_order'] = i0.Variable<bool>(isIncludeInOrder.value);
    }
    if (orderItemId.present) {
      map['order_item_id'] = i0.Variable<int>(orderItemId.value);
    }
    if (cartId.present) {
      map['cart_id'] = i0.Variable<int>(cartId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemTableCompanion(')
          ..write('isIncludeInOrder: $isIncludeInOrder, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('cartId: $cartId')
          ..write(')'))
        .toString();
  }
}
