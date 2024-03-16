import 'package:driving_license/features/questions/application/user_answer/user_answer_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class AnswerCardListController extends _$AnswerCardListController {
  @override
  FutureOr<void> build() {}

  UserAnswerService get _userAnswerService =>
      ref.read(userAnswerServiceProvider);

  Future<void> selectAnswer(Question question, int answerOptionIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _userAnswerService.saveUserAnswer(question, answerOptionIndex),
    );
  }
}
