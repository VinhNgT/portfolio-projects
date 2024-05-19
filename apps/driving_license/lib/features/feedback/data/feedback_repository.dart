import 'package:dio/dio.dart';
import 'package:driving_license/backend/remote_config/firebase_remote_config.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/networking/dio_provider.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  final Dio dio;
  final FirebaseRemoteConfig firebaseRemoteConfig;

  const FeedbackRepository({
    required this.dio,
    required this.firebaseRemoteConfig,
  });

  Future<Response> _handle302(Response redirectResponse) async {
    final newLocation = redirectResponse.headers['location']![0];
    final response = await dio.get(newLocation);
    return response;
  }

  Future<void> submitFeedback(
    FeedbackForm feedbackForm, {
    CancelToken? cancelToken,
  }) async {
    final postLink = firebaseRemoteConfig.getString('gs_feedback_post_link');
    final response = await dio.post(
      postLink,
      data: feedbackForm.toJson(),
      cancelToken: cancelToken,
      options: Options(
        validateStatus: (status) => status == 200 || status == 302,
      ),
    );

    if (response.statusCode == 302) {
      await _handle302(response);
    }
  }
}

@Riverpod(keepAlive: true)
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final firebaseRemoteConfig = ref.watch(firebaseRemoteConfigProvider);

  return FeedbackRepository(
    dio: dio,
    firebaseRemoteConfig: firebaseRemoteConfig,
  );
}
