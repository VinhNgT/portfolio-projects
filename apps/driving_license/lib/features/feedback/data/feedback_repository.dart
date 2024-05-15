import 'package:dio/dio.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/networking/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  final Dio dio;
  const FeedbackRepository(this.dio);

  Future<Response> _handle302(Response redirectResponse) async {
    final newLocation = redirectResponse.headers['location']![0];
    final response = await dio.get(newLocation);
    return response;
  }

  Future<void> submitFeedback(FeedbackForm feedbackForm) async {
    final response = await dio.post(
      'https://script.google.com/macros/s/AKfycbx1leG3Gkw_p1RpaxNOdkmtFJfoyCMj1EtJnhOsKnq7bjduJB4oxsm1JmZIMtX-faqA/exec',
      data: feedbackForm.toJson(),
      options: Options(
        validateStatus: (status) => status == 200 || status == 302,
      ),
    );

    if (response.statusCode == 302) {
      await _handle302(response);
    }
  }
}

@riverpod
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return FeedbackRepository(dio);
}
