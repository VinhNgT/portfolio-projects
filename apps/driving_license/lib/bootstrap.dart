import 'dart:ui';

import 'package:driving_license/app.dart';
import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/data/sembast_bookmarks_repository.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/data/sembast_exams_repository.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/question/sqlite_questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/sembast_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/logging/async_error_logger.dart';
import 'package:driving_license/logging/error_logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bootstrap {
  static Future<Widget> initApp() async {
    final container = await _createProviderContainer();
    return createRootWidget(container);
  }

  static Future<ProviderContainer> _createProviderContainer() async {
    // Load question database
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

  @protected
  static Future<UncontrolledProviderScope> createRootWidget(
    ProviderContainer container,
  ) async {
    _setupErrorHandlers(container);
    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  static void _setupErrorHandlers(ProviderContainer container) {
    final errorLogger = container.read(consoleErrorLoggerProvider);

    // Log all asynchronous errors
    container.observers.addAll([
      AsyncErrorLogger(errorLogger),
      // ProviderDebugObserver(),
    ]);

    // Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };

    // Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };

    // Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Center(child: Text(details.toString()));
    };
  }
}
