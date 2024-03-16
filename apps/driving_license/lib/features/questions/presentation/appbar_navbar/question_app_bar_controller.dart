import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_app_bar_controller.g.dart';

@riverpod
class QuestionAppBarController extends _$QuestionAppBarController {
  @override
  FutureOr<void> build() {}

  UserAnswersRepository get _userAnswersRepository =>
      ref.read(userAnswersRepositoryProvider);

  Future<void> deleteAnswer(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _userAnswersRepository.deleteUserAnswer(question),
    );
  }
}
