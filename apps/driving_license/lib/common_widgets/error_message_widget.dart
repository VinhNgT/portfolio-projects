import 'package:driving_license/constants/app_flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable error message widget (just a [Text] with a red color).
class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (appFlavor == AppFlavor.dev.name) {
      return Text(
        errorMessage,
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
      );
    }

    return const Center(child: Text('Đã có lỗi xảy ra'));
  }
}
