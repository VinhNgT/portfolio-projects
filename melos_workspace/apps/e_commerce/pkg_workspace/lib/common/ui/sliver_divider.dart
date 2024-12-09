import 'package:flutter/material.dart';

class SliverDivider extends StatelessWidget {
  const SliverDivider({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        height: size,
        thickness: size,
      ),
    );
  }
}
