import 'package:e_commerce/constants/app_flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// Error widget that show when an app level error occurs.
class AppErrorWidget extends HookConsumerWidget {
  /// Create an app level error widget.
  const AppErrorWidget({super.key, this.errorMessage});

  final String? errorMessage;
  final String _defaultErrorMessage = 'Đã có lỗi xảy ra';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolvedErrorMessage = useRef(_resolveErrorMessage());

    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgPicture(
                AssetBytesLoader(
                  'assets/icons/compiled/view_error.svg.vec',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                resolvedErrorMessage.value,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveErrorMessage() {
    if (appFlavor == AppFlavors.production) {
      return _defaultErrorMessage;
    }
    return errorMessage ?? _defaultErrorMessage;
  }
}

/// Error widget that show when a widget level error occurs.
class WidgetErrorWidget extends HookConsumerWidget {
  /// Create a widget level error widget.
  const WidgetErrorWidget({super.key, this.errorMessage});

  final String? errorMessage;
  final String _defaultErrorMessage = 'Đã có lỗi xảy ra';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolvedErrorMessage = useRef(_resolveErrorMessage());

    if (appFlavor == AppFlavors.production) {
      return Center(child: Text(resolvedErrorMessage.value));
    }

    return Text(
      resolvedErrorMessage.value,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }

  String _resolveErrorMessage() {
    if (appFlavor == AppFlavors.production) {
      return _defaultErrorMessage;
    }
    return errorMessage ?? _defaultErrorMessage;
  }
}
