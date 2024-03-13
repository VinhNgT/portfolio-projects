import 'package:driving_license/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final bool showLoadingIndicator;
  final AsyncValue<T> value;
  final Widget Function(T) builder;

  const AsyncValueWidget({
    super.key,
    this.showLoadingIndicator = false,
    required this.value,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => showLoadingIndicator
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink(),
    );
  }
}
