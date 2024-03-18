import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_page_controller.g.dart';

// Scroll controller for AppBar to use to calculate its background color
@riverpod
class QuestionPageScrollController extends _$QuestionPageScrollController {
  @override
  Raw<ScrollController?> build(int pageIndex) {
    return null;
  }

  set value(ScrollController newScrollController) {
    state = newScrollController;
  }
}

// Because riverpod will auto dispose any provider that is not being listened,
// QuestionPageScrollControllerProvider of nearby pages will not save their
// scroll controller, causing them to be null when being accessed.
//
// To workaroud this, we need to keep all nearby
// QuestionPageScrollControllerProvider alive by listening to them.
//
// This is a feature of riverpod, not a bug. Otherwise it will cause memory
// leak if we keep all providers alive.
@riverpod
void keepQuestionPageScrollControllerAlive(
  KeepQuestionPageScrollControllerAliveRef ref,
) {
  final currentPageIndex = ref.watch(currentPageIndexProvider);

  ref.listen(
    questionPageScrollControllerProvider(currentPageIndex),
    (_, __) {},
  );
  ref.listen(
    questionPageScrollControllerProvider(currentPageIndex + 1),
    (_, __) {},
  );
  ref.listen(
    questionPageScrollControllerProvider(currentPageIndex - 1),
    (_, __) {},
  );

  return;
}

// When QuestionPageScrollController.animateTo is called, all content inside
// QuestionPage SingleChildScrollView need to keep it size until the animation
// is completed, other wise there will be an ugly jump in the UI.
//
// This provider is used to provide a way for other pages to notify QuestionPage
// about upcoming animation, so QuestionPage can prepare before it and ensure
// the size of its content is kept until the animation is completed.
//
// This is popably a bug in Flutter ¯\_(ツ)_/¯
@riverpod
class QuestionPageScrollingAnimationPlaying
    extends _$QuestionPageScrollingAnimationPlaying {
  @override
  bool build(int pageIndex) {
    return false;
  }

  void begin() {
    state = true;
  }

  void end() {
    state = false;
  }
}
