import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/data/sembast_bookmarks_repository.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/data/sembast_exams_repository.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/question/sqlite_questions_repository.dart';
import 'package:driving_license/features/questions/data/question/test_questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/sembast_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/logging/error_logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
abstract class BootstrapDelegate {
  const BootstrapDelegate();

  Future<ProviderContainer> createProviderContainer();
  Future<void> setupServices(ProviderContainer container);
  ErrorLogger getErrorLogger(ProviderContainer container);
}

class ProductionBootstrapDelegate extends BootstrapDelegate {
  const ProductionBootstrapDelegate();

  @override
  Future<ProviderContainer> createProviderContainer() async {
    final sqliteQuestionsRepository =
        await SqliteQuestionsRepository.makeDefault();
    final sembastUserAnswersRepository =
        await SembastUserAnswersRepository.makeDefault();
    final bookmarksRepository = await SembastBookmarksRepository.makeDefault();
    final examsRepository = await SembastExamsRepository.makeDefault();

    final container = ProviderContainer(
      overrides: [
        questionsRepositoryProvider
            .overrideWithValue(sqliteQuestionsRepository),
        userAnswersRepositoryProvider
            .overrideWithValue(sembastUserAnswersRepository),
        bookmarksRepositoryProvider.overrideWithValue(bookmarksRepository),
        examsRepositoryProvider.overrideWithValue(examsRepository),
      ],
    );

    return container;
  }

  @override
  Future<void> setupServices(ProviderContainer container) async {
    return;
  }

  @override
  ErrorLogger getErrorLogger(ProviderContainer container) {
    return container.read(consoleErrorLoggerProvider);
  }
}

class TestBootstrapDelegate extends BootstrapDelegate {
  const TestBootstrapDelegate();

  @override
  Future<ProviderContainer> createProviderContainer() async {
    final testQuestionsRepository = TestQuestionsRepository();
    final container = ProviderContainer(
      overrides: [
        questionsRepositoryProvider.overrideWithValue(testQuestionsRepository),
      ],
    );

    return container;
  }

  @override
  Future<void> setupServices(ProviderContainer container) async {
    return;
  }

  @override
  ErrorLogger getErrorLogger(ProviderContainer container) {
    return container.read(consoleErrorLoggerProvider);
  }
}
