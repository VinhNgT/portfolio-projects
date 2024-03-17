import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_app_bar_controller.g.dart';

@riverpod
class QuestionAppBarController extends _$QuestionAppBarController {
  @override
  FutureOr<void> build() {}

  QuestionsService get _questionsService =>
      ref.read(questionsServiceControllerProvider);

  Future<void> deleteAnswer(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _questionsService.clearUserAnswer(question),
    );
  }
}
