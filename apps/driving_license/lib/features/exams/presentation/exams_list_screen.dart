import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/features/exams/presentation/exams_list_empty.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class ExamsListScreen extends HookConsumerWidget {
  const ExamsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: context.materialScheme.surfaceContainer,
        title: const Text('Bộ đề thi thử'),
        actions: [
          IconButton(
            icon: const Icon(Symbols.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Symbols.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: const ExamsListEmpty(),
    );
  }
}
