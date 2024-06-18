import 'package:e_commerce/constants/app_flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable error message widget (just a [Text] with a red color).
class AsyncErrorWidget extends StatelessWidget {
  const AsyncErrorWidget(this.errorMessage, {super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (appFlavor == AppFlavors.production) {
      return const Center(child: Text('Đã có lỗi xảy ra'));
    }

    return Text(
      errorMessage,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}
