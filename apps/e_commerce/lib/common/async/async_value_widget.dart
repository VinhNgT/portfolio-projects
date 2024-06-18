import 'package:e_commerce/common/async/async_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AsyncValueWidgetBuilder<T> = Widget Function(T dataValue);

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.asyncValue,
    this.showLoadingIndicator = false,
    required this.builder,
  });

  final AsyncValue<T> asyncValue;
  final bool showLoadingIndicator;
  final AsyncValueWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      // When data
      AsyncValue(:final value, hasValue: true) when value != null =>
        builder(value),

      // When error
      AsyncValue(:final error?, hasError: true) =>
        AsyncErrorWidget(error.toString()),

      // When loading
      AsyncValue(isLoading: true) => showLoadingIndicator
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink(),
      _ => throw UnimplementedError(),
    };
  }
}
