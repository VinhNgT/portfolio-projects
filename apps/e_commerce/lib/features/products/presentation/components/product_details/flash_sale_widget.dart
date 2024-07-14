import 'package:e_commerce/common/ui/container_badge.dart';
import 'package:flutter/material.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContainerBadge(
      labelText: 'Flash sale kết thúc sau 2 giờ',
    );
  }
}
