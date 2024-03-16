import 'package:driving_license/bootstrap.dart';
import 'package:driving_license/features/questions/data/question/question_repository.dart';
import 'package:driving_license/features/questions/data/question/test_question_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BootstrapTest extends Bootstrap {
  static Future<Widget> initApp() async {
    final container = await _createProviderContainer();
    return Bootstrap.createRootWidget(container);
  }

  static Future<ProviderContainer> _createProviderContainer() async {
    final testQuestionRepository = TestQuestionRepository();
    final container = ProviderContainer(
      overrides: [
        questionRepositoryProvider.overrideWithValue(testQuestionRepository),
      ],
    );

    return container;
  }
}
