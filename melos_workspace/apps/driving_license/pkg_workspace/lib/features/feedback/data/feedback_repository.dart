import 'package:dio/dio.dart';
import 'package:driving_license/backend/app_config/app_config.dart';
import 'package:driving_license/backend/app_config/domain/app_config_data.dart';
import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/networking/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  const FeedbackRepository({
    required this.dio,
    required this.appConfig,
  });

  final Dio dio;
  final AppConfigData appConfig;

  Future<Response> _handle302(Response redirectResponse) async {
    final newLocation = redirectResponse.headers['location']![0];
    final response = await dio.get(newLocation);
    return response;
  }

  Future<void> submitFeedback(
    FeedbackForm feedbackForm, {
    CancelToken? cancelToken,
  }) async {
    final postLink = appConfig.gsFeedbackPostLink;
    var response = await dio.post(
      postLink,
      data: feedbackForm.toJson(),
      cancelToken: cancelToken,
      options: Options(
        validateStatus: (status) => status == 200 || status == 302,
      ),
    );

    if (response.statusCode == 302) {
      response = await _handle302(response);
    }

    if (response.data
        case {'status': final String status, 'message': final String message}
        when status != 'SUCCESS') {
      throw SubmitFeedbackFailedException(message);
    }
  }

  Future<void> unlockAllFeatures() async {
    final unlockAllFeatures = appConfig.unlockAllFeatures;

    debugPrint('Unlock all features: $unlockAllFeatures');
    // if (!unlockAllFeatures) {
    //   throw UnlockAllFeaturesFailedException();
    // }
  }
}

@Riverpod(keepAlive: true)
FeedbackRepository feedbackRepository(FeedbackRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final appConfig = ref.watch(appConfigProvider).requireValue;

  return FeedbackRepository(
    dio: dio,
    appConfig: appConfig,
  );
}
