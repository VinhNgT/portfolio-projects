import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exams_repository.g.dart';

typedef ExamsMap = Map<int, Exam>;

abstract class ExamsRepository {
  FutureOr<void> saveExam(Exam exam);
  FutureOr<void> deleteExam(Exam exam);
  FutureOr<void> renameExam(Exam exam, String newName);

  Stream<List<Exam>> watchAllExamsByLicense(License license);
}

@Riverpod(keepAlive: true)
ExamsRepository examsRepository(
  ExamsRepositoryRef ref,
) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}