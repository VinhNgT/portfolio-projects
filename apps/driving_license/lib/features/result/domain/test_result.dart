import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_result.freezed.dart';
part 'test_result.g.dart';

@freezed
abstract class TestResult with _$TestResult {
  factory TestResult({
    required int totalQuestions,
    required int answeredQuestions,
    required int correctAnswers,
    required int wrongAnswers,
  }) = _TestResult;
  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);
}
