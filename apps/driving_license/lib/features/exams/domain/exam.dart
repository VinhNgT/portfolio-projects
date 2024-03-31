import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question_metadata.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
abstract class Exam with _$Exam {
  const factory Exam({
    required String name,
    required DateTime createdTime,
    required List<QuestionMetadata> questionsMetadata,
    required License license,
    TestResult? testResult,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}
