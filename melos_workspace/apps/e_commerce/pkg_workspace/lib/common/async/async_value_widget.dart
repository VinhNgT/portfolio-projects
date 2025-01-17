import 'package:e_commerce/exceptions/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AsyncValueWidgetBuilder<T> = Widget Function(T dataValue);

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.asyncValue,
    this.showPreviousDataWhileLoading = false,
    this.showLoadingIndicator = false,
    required this.builder,
  });

  final AsyncValue<T> asyncValue;
  final bool showPreviousDataWhileLoading;
  final bool showLoadingIndicator;
  final AsyncValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      // When error
      AsyncValue(:final error?, hasError: true) =>
        AppErrorWidget(errorMessage: error.toString(), isCompact: true),

      // When loading
      AsyncValue(isLoading: true, :final hasValue)
          when !hasValue || (hasValue && !showPreviousDataWhileLoading) =>
        showLoadingIndicator
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox.shrink(),

      // When data
      AsyncValue(:final value, hasValue: true) when value != null =>
        builder(value),
      _ => throw UnimplementedError(),
    };
  }
}
