import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class AnswerCardListController extends _$AnswerCardListController {
  @override
  FutureOr<void> build() {}

  QuestionsService get _questionsService =>
      ref.read(questionsServiceControllerProvider);

  Future<void> selectAnswer(Question question, int answerOptionIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _questionsService.saveUserAnswer(question, answerOptionIndex),
    );
  }
}
