import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
abstract class Exam with _$Exam {
  const factory Exam({
    @Default('000000000000000000000000000') String examId,
    required String name,
    required DateTime createdUtcTime,
    required List<int> questionDbIndexes,
    required License license,
    TestResult? testResult,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}
