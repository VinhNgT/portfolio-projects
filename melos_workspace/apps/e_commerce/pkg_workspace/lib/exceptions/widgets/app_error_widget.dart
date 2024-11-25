import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// Error widget that show when an app level error occurs.
class AppErrorWidget extends HookConsumerWidget {
  const AppErrorWidget({
    super.key,
    this.errorMessage,
    this.userFriendlyErrorMessage,
    this.isCompact = false,
  });

  /// The error message to show when envProvider.showDetailedError is true.
  final String? errorMessage;

  /// The error message to show to the user when envProvider.showDetailedError
  /// is false.
  final String? userFriendlyErrorMessage;

  /// The default error message to show when no error message is provided.
  final String _defaultErrorMessage = 'Đã có lỗi xảy ra';

  /// Whether to show the error message in a compact form (small text, without
  /// icon).
  final bool isCompact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDetailedError = ref.watch(envProvider).showDetailedError;
    final resolvedErrorMessage = _resolveErrorMessage(showDetailedError);

    return isCompact
        ? _CompactErrorWidget(
            message: resolvedErrorMessage,
            isUserFriendly: !showDetailedError,
          )
        : Material(
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
                      resolvedErrorMessage,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  String _resolveErrorMessage(bool showDetailedError) {
    if (showDetailedError) {
      return errorMessage ?? _defaultErrorMessage;
    }
    return userFriendlyErrorMessage ?? _defaultErrorMessage;
  }
}

class _CompactErrorWidget extends StatelessWidget {
  const _CompactErrorWidget({
    required this.message,
    required this.isUserFriendly,
  });

  final String message;
  final bool isUserFriendly;

  @override
  Widget build(BuildContext context) {
    return isUserFriendly
        ? Center(child: Text(message))
        : Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.red),
          );
  }
}
