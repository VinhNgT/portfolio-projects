import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:realm/realm.dart';

part 'order.mapper.dart';
part 'order.realm.dart';

@realmEmbedded
class $OrderRealm {
  late List<$OrderItemRealm> items;
  late double orderDiscount;
}

@MappableClass()
class Order with OrderMappable {
  final List<OrderItem> items;
  final double orderDiscount;

  const Order({
    required this.items,
    this.orderDiscount = 0,
  });

  factory Order.fromRealmObj(OrderRealm obj) => Order(
        items: obj.items.map(OrderItem.fromRealmObj).toList(),
        orderDiscount: obj.orderDiscount,
      );

  OrderRealm toRealmObj(Realm realm) {
    return OrderRealm(
      items: items.map((e) => e.toRealmObj(realm)),
      orderDiscount: orderDiscount,
    );
  }
}

extension OrderMethods on Order {
  double get itemsPrice => items.fold(
        0,
        (previousValue, element) => previousValue + element.price,
      );

  double get shippingFee => items.fold(
        0,
        (previousValue, element) => previousValue + element.shippingFee,
      );

  double get totalPrice => itemsPrice + shippingFee - orderDiscount;
}

extension OrderMutation on Order {
  Order addDiscount(double discount) =>
      copyWith(orderDiscount: orderDiscount + discount);
}
