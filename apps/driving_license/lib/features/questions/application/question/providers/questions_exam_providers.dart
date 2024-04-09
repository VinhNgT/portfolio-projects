import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_exam_providers.g.dart';

@riverpod
Stream<Exam> currentExam(CurrentExamRef ref) async* {
  final questionsService =
      await ref.watch(questionsServiceControllerProvider.future);
  final examsRepository = ref.watch(examsRepositoryProvider);

  if (questionsService.operatingMode
      case ExamOperatingMode(exam: Exam(:final examId))) {
    yield* examsRepository.watchExamById(examId);
  }

  throw StateError('QuestionsService is not in ExamOperatingMode, cannot get '
      'current exam.');
}
