import 'package:dart_mappable/dart_mappable.dart';
import 'package:e_commerce/features/orders/domain/order_item.dart';

part 'order.mapper.dart';

@MappableClass()
class Order with OrderMappable {
  final int? id;
  final List<OrderItem> items;
  final String receiveAddress;
  // final double orderDiscount;

  const Order({
    this.id,
    required this.items,
    required this.receiveAddress,
    // required this.orderDiscount,
  });

  // Order.create({
  //   required List<OrderItem> items,
  //   double orderDiscount = 0,
  // }) : this(items: items);
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

  double get totalPrice => itemsPrice + shippingFee;
}

extension OrderMutation on Order {
  // Order addDiscount(double discount) =>
  //     copyWith(orderDiscount: orderDiscount + discount);
}
