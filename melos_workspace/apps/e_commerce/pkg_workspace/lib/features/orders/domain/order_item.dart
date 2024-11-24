import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:e_commerce/backend/database/drift_provider.dart';
import 'package:e_commerce/features/products/domain/product.dart';
import 'package:e_commerce/features/products/domain/product_variant.dart';
import 'package:e_commerce/features/products/domain/product_variant_group.dart';

part 'order_item.mapper.dart';

class OrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  // ignore: recursive_getters
  IntColumn get quantity => integer().check(quantity.isBiggerOrEqualValue(0))();
}

class OrderItemVariantSelectionTable extends Table {
  IntColumn get orderItemId =>
      integer().references(OrderItemTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get variantId => integer().references(ProductVariantTable, #id)();

  @override
  Set<Column> get primaryKey => {orderItemId, variantId};
}

@MappableClass()
class OrderItem with OrderItemMappable {
  /// The unique identifier of this order item.
  final int? id;

  /// The product that this order item represents.
  final Product product;

  /// The quantity of this order item.
  final int quantity;

  /// The map of the selected variant for each variant group.
  /// The key is the variant group's id.
  final ProductVariantIdsSelection variantSelection;

  OrderItem({
    this.id,
    required this.product,
    required this.quantity,
    required this.variantSelection,
  }) {
    // Validate the quantity.
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }

    // Validate the selected variant.
    for (final group in product.variantGroups) {
      final groupSelectedVariant = variantSelection[group.id];

      if (groupSelectedVariant == null) {
        throw ArgumentError.value(
          variantSelection,
          'variantSelection',
          'No variant selected for group ${group.groupName}',
        );
      }

      if (!group.variants
          .any((variant) => variant.id == groupSelectedVariant)) {
        throw ArgumentError.value(
          variantSelection,
          'variantSelection',
          'The selected variant $groupSelectedVariant is not in the '
              'group ${group.groupName}',
        );
      }
    }
  }

  static Future<OrderItem> fromDbData(
    AppDatabase db,
    OrderItemTableData data,
  ) async {
    final productQuery = db.select(db.productTable, distinct: true).join([
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
      ..where(db.orderItemTable.id.equals(data.id));

    final productData =
        (await productQuery.getSingle()).readTable(db.productTable);

    final variantSelectionQuery = db
        .select(db.orderItemVariantSelectionTable)
        .join([
      innerJoin(
        db.productVariantTable,
        db.productVariantTable.id
            .equalsExp(db.orderItemVariantSelectionTable.variantId),
      ),
      innerJoin(
        db.productVariantGroupTable,
        db.productVariantGroupTable.id
            .equalsExp(db.productVariantTable.groupId),
      ),
    ])
      ..where(db.orderItemVariantSelectionTable.orderItemId.equals(data.id));

    final variantSelectionStringMap = (await variantSelectionQuery.get()).fold(
        <ProductVariantGroupId, ProductVariantId?>{}, (previousValue, element) {
      final groupId = element.read(db.productVariantGroupTable.id)!;
      final variantId = element.read(db.productVariantTable.id);

      return {
        ...previousValue,
        groupId: variantId,
      };
    });

    return OrderItem(
      id: data.id,
      product: await Product.fromDbData(db, productData),
      quantity: data.quantity,
      variantSelection: variantSelectionStringMap,
    );
  }

  OrderItemTableCompanion toDbCompanion() {
    return OrderItemTableCompanion(
      id: Value.absentIfNull(id),
      quantity: Value(quantity),
    );
  }

  static final prototype = _Proto.prototype;
}

extension OrderItemGetters on OrderItem {
  double get price => product.vndDiscountedPrice.toDouble() * quantity;
  double get shippingFee => 13000.0 * quantity;

  List<ProductVariant> get productVariantSelection => product.variantGroups
      .where((groupId) => variantSelection.containsKey(groupId.id))
      .map(
        (e) => e.variants
            .firstWhere((variant) => variant.id == variantSelection[e.id]),
      )
      .toList();
}

extension OrderItemMethods on OrderItem {
  /// Returns true if [other] has the same product and selected variant.
  bool hasSameContent(OrderItem other) {
    return product.id == other.product.id &&
        const MapEquality<ProductVariantGroupId, ProductVariantId?>()
            .equals(variantSelection, other.variantSelection);
  }
}

extension _Proto on OrderItem {
  static final prototype = OrderItem(
    id: 999,
    product: Product.prototype,
    quantity: 1,
    variantSelection: {
      for (final group in Product.prototype.variantGroups)
        group.id!: group.variants.first.id,
    },
  );
}
