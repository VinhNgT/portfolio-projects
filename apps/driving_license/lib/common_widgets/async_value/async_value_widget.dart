import 'package:driving_license/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that handles different states of an asynchronous value and builds
/// the UI accordingly.
class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T) builder;

  /// Creates an [AsyncValueWidget] with the given parameters.
  ///
  /// The [value] represents the asynchronous value to handle.
  ///
  /// The [showLoadingIndicator] determines whether to show the loading
  /// indicator.
  ///
  /// The [loadingWidget] is the widget to display when the value is loading.
  /// If this is provided, the [showLoadingIndicator] will be ignored.
  ///
  /// The [builder] is a function that builds the UI based on the data value.
  const AsyncValueWidget({
    super.key,
    required this.value,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () =>
          loadingWidget ?? _LoadingIndicator(hidden: !showLoadingIndicator),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  final bool hidden;
  const _LoadingIndicator({this.hidden = false});

  @override
  Widget build(BuildContext context) {
    return hidden
        ? const SizedBox.shrink()
        : const Center(child: CircularProgressIndicator());
  }
}
