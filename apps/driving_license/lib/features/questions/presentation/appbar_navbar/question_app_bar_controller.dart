import 'package:driving_license/features/questions/data/user_answer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_app_bar_controller.g.dart';

@riverpod
class QuestionAppBarController extends _$QuestionAppBarController {
  @override
  FutureOr<void> build() {}

  UserAnswerRepository get _userAnswerRepository =>
      ref.read(userAnswerRepositoryProvider);

  Future<void> deleteAnswer(
    int questionIndex,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _userAnswerRepository.deleteUserAnswer(questionIndex),
    );
  }
}
