import 'package:dio/dio.dart';
import 'package:driving_license/features/feedback/data/feedback_repository.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_feedback_controller.g.dart';

class SendFeedbackController {
  final FeedbackRepository feedbackRepository;
  final CancelToken? cancelToken;

  SendFeedbackController(this.feedbackRepository, [this.cancelToken]);

  Future<void> submitFeedback(FeedbackForm feedback) async {
    await feedbackRepository.submitFeedback(
      feedback,
      cancelToken: cancelToken,
    );
  }
}

@riverpod
SendFeedbackController sendFeedbackController(SendFeedbackControllerRef ref) {
  final feedbackRepository = ref.watch(feedbackRepositoryProvider);
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  return SendFeedbackController(feedbackRepository, cancelToken);
}
