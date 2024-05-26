import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/features/exams/application/exams_service.dart';
import 'package:driving_license/features/exams/presentation/dialogs/new_exam_dialog.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreateExamFloatingButton extends HookConsumerWidget {
  const CreateExamFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      icon: const Icon(Symbols.add),
      label: const Text('Tạo bộ đề mới'),
      onPressed: () async {
        final userConsent = await _getUserAdConsent(context, ref);

        if (!userConsent || !context.mounted) {
          return;
        }

        final isAdWatched = await _showAd(context, ref);

        if (!context.mounted) {
          return;
        }

        if (isAdWatched) {
          context.showSnackBar(
            const SnackBar(
              content: Text('Cảm ơn bạn đã xem quảng cáo!'),
            ),
          );

          final examsService = await ref.read(examsServiceProvider.future);
          await examsService.createExam();
        }
      },
    );
  }

  Future<bool> _getUserAdConsent(BuildContext context, WidgetRef ref) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => const NewExamDialog(),
        ) ??
        false;
  }

  Future<bool> _showAd(BuildContext context, WidgetRef ref) async {
    return await context.pushRoute<bool>(
          RewardedAdRoute(adUnit: AdUnit.createNewExam),
        ) ??
        false;
  }
}

class AnimatedCreateExamFloatingButton extends HookConsumerWidget {
  const AnimatedCreateExamFloatingButton({super.key, required this.show});
  final bool show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: Durations.short3,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1.5),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      },
      child: show ? const CreateExamFloatingButton() : const SizedBox.shrink(),
    );
  }
}
