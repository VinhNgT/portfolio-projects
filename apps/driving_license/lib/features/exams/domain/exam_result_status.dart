import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';

sealed class ExamResultStatus {
  ExamResultStatus({
    required this.exam,
    required this.userAnswersSummary,
  }) {
    assert(correctAnswersCount + wrongAnswersCount <= totalQuestionsCount);
  }

  factory ExamResultStatus.grade({
    required Exam exam,
    required UserAnswersSummary userAnswersSummary,
  }) {
    final correctAnswersCount = userAnswersSummary.correct;
    final minimalPassingScore = exam.minimumPassingScore;
    final wrongAnswersIsDangerCount = userAnswersSummary.wrongIsDanger;

    if (wrongAnswersIsDangerCount > 0) {
      return ExamResultStatusFailed(
        exam: exam,
        userAnswersSummary: userAnswersSummary,
      );
    }

    if (correctAnswersCount < minimalPassingScore) {
      return ExamResultStatusFailed(
        exam: exam,
        userAnswersSummary: userAnswersSummary,
      );
    }

    return ExamResultStatusPassed(
      exam: exam,
      userAnswersSummary: userAnswersSummary,
    );
  }
  final Exam exam;
  final UserAnswersSummary userAnswersSummary;

  int get totalQuestionsCount => exam.questionsCount;
  int get correctAnswersCount => userAnswersSummary.correct;
  int get wrongAnswersCount => userAnswersSummary.wrong;
  int get wrongAnswersIsDangerCount => userAnswersSummary.wrongIsDanger;
}

class ExamResultStatusPassed extends ExamResultStatus {
  ExamResultStatusPassed({
    required super.exam,
    required super.userAnswersSummary,
  });

  bool get isPerfect => correctAnswersCount == totalQuestionsCount;
}

class ExamResultStatusFailed extends ExamResultStatus {
  ExamResultStatusFailed({
    required super.exam,
    required super.userAnswersSummary,
  });

  bool get isDanger => wrongAnswersIsDangerCount > 0;
}
