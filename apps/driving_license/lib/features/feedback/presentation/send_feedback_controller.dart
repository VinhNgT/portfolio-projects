import 'package:driving_license/features/feedback/data/feedback_repository.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_feedback_controller.g.dart';

@riverpod
class SendFeedbackController extends _$SendFeedbackController {
  @override
  FutureOr<void> build() {}

  FeedbackRepository get _feedbackRepository =>
      ref.read(feedbackRepositoryProvider);

  Future<void> submitFeedback(FeedbackForm feedback) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => _feedbackRepository.submitFeedback(feedback),
    );
  }
}
