import 'package:driving_license/features/exams/application/questions_selector.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:driving_license/utils/datetime_formatter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exams_service.g.dart';

class ExamsService {
  final ExamsRepository examsRepository;
  final QuestionsRepository questionsRepository;
  final License license;

  late final QuestionSelector _questionSelector;

  ExamsService({
    required this.examsRepository,
    required this.questionsRepository,
    required this.license,
  }) {
    _questionSelector = QuestionSelector(
      license: license,
      questionsRepository: questionsRepository,
    );
  }

  FutureOr<void> createExam() async {
    final examQuestions = await _questionSelector.generateQuestions();
    final currentTime = DateTime.now();

    final exam = Exam(
      name: 'Đề ${DateTimeFormatter.formatLocalTimeDay(currentTime)}',
      createdUtcTime: currentTime.toUtc(),
      questionDbIndexes: examQuestions,
      license: license,
    );

    examsRepository.saveExam(exam);
  }

  Stream<List<Exam>> watchExamsList() {
    return examsRepository.watchAllExamsByLicense(license);
  }

  FutureOr<void> gradeExam(Exam exam, UserAnswersMap userAnswers) {
    final total = exam.questionDbIndexes.length;
    int answered = 0;
    int correct = 0;
    int wrong = 0;

    for (final questionId in exam.questionDbIndexes) {
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

    return examsRepository.saveExamResult(
      exam,
      TestResult(
        totalQuestions: total,
        answeredQuestions: answered,
        correctAnswers: correct,
        wrongAnswers: wrong,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
FutureOr<ExamsService> examsService(ExamsServiceRef ref) async {
  final examsRepository = ref.watch(examsRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  final license = await ref.watch(userSelectedLicenseProvider.future);

  return ExamsService(
    examsRepository: examsRepository,
    questionsRepository: questionsRepository,
    license: license,
  );
}

@riverpod
Stream<List<Exam>> examsListStream(ExamsListStreamRef ref) async* {
  final examsService = await ref.watch(examsServiceProvider.future);
  yield* examsService.watchExamsList();
}
