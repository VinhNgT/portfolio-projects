import 'package:driving_license/features/questions/data/user_answer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class SelectedAnswerIndex extends _$SelectedAnswerIndex {
  @override
  int? build(int questionPageIndex) {
    return null;
  }

  set value(int? newValue) {
    state = newValue;
  }
}

@riverpod
class AnswerCardListController extends _$AnswerCardListController {
  @override
  FutureOr<void> build() {}

  UserAnswerRepository get _userAnswerRepository =>
      ref.read(userAnswerRepositoryProvider);

  Future<void> selectAnswer(
    int questionPageIndex,
    int answerOptionIndex,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _userAnswerRepository.saveUserAnswer(
        questionPageIndex,
        answerOptionIndex,
      ),
    );
  }
}
