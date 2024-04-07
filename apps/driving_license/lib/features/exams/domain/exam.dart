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
    DateTime? lastAttemptedUtcTime,
  }) = _Exam;
  const Exam._();

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  factory Exam.prototype() => Exam(
        name: 'Prototype\nPrototype',
        createdUtcTime: DateTime(1999),
        questionDbIndexes: [0],
        license: License.all,
      );

  String get licenseType => license.name.toUpperCase();
  Duration get examDuration =>
      Duration(minutes: license.examInfo.examDurationInMinutes);
  int get minimumPassingScore => license.examInfo.minimumPassingScore;
}
