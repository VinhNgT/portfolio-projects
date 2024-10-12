import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/backend/database/realm/named_realm_annotations.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';
import 'package:realm/realm.dart';

part 'order.mapper.dart';
part 'order.realm.dart';

@MappableClass()
class Order with OrderMappable {
  final List<OrderItem> items;
  final double orderDiscount;

  const Order({
    required this.items,
    required this.orderDiscount,
  });

  Order.create({
    required List<OrderItem> items,
    double orderDiscount = 0,
  }) : this(items: items, orderDiscount: orderDiscount);

  factory Order.fromRealmObj(OrderRealm obj) =>
      OrderRealmConverter.fromRealmObj(obj);
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

@realmEmbedded
class $OrderRealm {
  late List<$OrderItemRealm> items;
  late double orderDiscount;
}

extension OrderRealmConverter on Order {
  static Order fromRealmObj(OrderRealm obj) {
    return Order(
      items: obj.items.map(OrderItem.fromRealmObj).toList(),
      orderDiscount: obj.orderDiscount,
    );
  }

  OrderRealm toRealmObj(Realm realm) {
    return OrderRealm(
      items: items.map((e) => e.toRealmObj(realm)).toList(),
      orderDiscount: orderDiscount,
    );
  }
}
