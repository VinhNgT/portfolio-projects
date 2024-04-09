import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:driving_license/utils/datetime_formatter.dart';
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

  factory Exam.createNew({
    required License license,
    required List<int> questionDbIndexes,
  }) =>
      Exam(
        name: 'Đề ${DateTimeFormatter.formatLocalTimeDay(DateTime.now())}',
        createdUtcTime: DateTime.now().toUtc(),
        questionDbIndexes: questionDbIndexes,
        license: license,
      );

  String get licenseType => license.name.toUpperCase();
  Duration get examDuration =>
      Duration(minutes: license.examInfo.examDurationInMinutes);
  int get minimumPassingScore => license.examInfo.minimumPassingScore;
}

extension ExamOperations on Exam {
  Exam gradeExam(UserAnswersMap userAnswers) {
    final total = questionDbIndexes.length;
    int answered = 0;
    int correct = 0;
    int wrong = 0;

    for (final questionId in questionDbIndexes) {
      final userAnswer = userAnswers[questionId];
      if (userAnswer != null) {
        answered++;

        if (userAnswer.selectedAnswerIndex ==
            userAnswer.questionMetadata.correctAnswerIndex) {
          correct++;
        } else {
          wrong++;
        }
      }
    }

    return copyWith(
      testResult: TestResult(
        totalQuestions: total,
        answeredQuestions: answered,
        correctAnswers: correct,
        wrongAnswers: wrong,
      ),
      lastAttemptedUtcTime: DateTime.now().toUtc(),
    );
  }
}
