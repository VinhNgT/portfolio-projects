import 'package:driving_license/features/questions/application/user_answer/user_answers_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class AnswerCardListController extends _$AnswerCardListController {
  @override
  FutureOr<void> build() {}

  UserAnswersService get _userAnswersService =>
      ref.read(userAnswersServiceProvider);

  Future<void> selectAnswer(Question question, int answerOptionIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _userAnswersService.saveUserAnswer(question, answerOptionIndex),
    );
  }
}
