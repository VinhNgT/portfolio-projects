import 'package:driving_license/bootstrap.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/question/test_questions_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BootstrapTest extends Bootstrap {
  static Future<Widget> initApp() async {
    final container = await _createProviderContainer();
    return Bootstrap.createRootWidget(container);
  }

  static Future<ProviderContainer> _createProviderContainer() async {
    final testQuestionsRepository = TestQuestionsRepository();
    final container = ProviderContainer(
      overrides: [
        questionsRepositoryProvider.overrideWithValue(testQuestionsRepository),
      ],
    );

    return container;
  }
}
