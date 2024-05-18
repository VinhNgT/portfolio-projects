import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncControllerWidget<T> extends StatelessWidget {
  final AsyncValue<void> value;
  final Widget child;

  const AsyncControllerWidget({
    super.key,
    required this.value,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (_) => child,
      error: (_, __) => child,
      loading: () => Stack(
        children: [
          child,
          Container(
            color: context.materialScheme.background,
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
