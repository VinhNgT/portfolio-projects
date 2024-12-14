import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn hàng'),
        actions: [
          IconButton(
            icon: Icon(Symbols.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Symbols.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('OrdersScreen'),
      ),
    );
  }
}
