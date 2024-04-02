import 'dart:async';

import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastExamsRepository implements ExamsRepository {
  SembastExamsRepository(this.db);

  final Database db;
  final examsStore = stringMapStoreFactory.store('exams');

  static Future<SembastExamsRepository> makeDefault() async {
    return SembastExamsRepository(
      await _createDatabase('exams.db'),
    );
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  @override
  FutureOr<void> saveExam(Exam exam) async {
    await db.transaction((txn) async {
      final examId = await examsStore.add(txn, exam.toJson());
      await examsStore.record(examId).update(txn, {'examId': examId});
    });
  }

  @override
  FutureOr<void> deleteExam(Exam exam) async {
    await examsStore.record(exam.examId).delete(db);
  }

  @override
  FutureOr<void> renameExam(Exam exam, String newName) async {
    await examsStore.record(exam.examId).update(db, {'name': newName});
  }

  @override
  Stream<List<Exam>> watchAllExamsByLicense(License license) {
    final recordSnapshotStream = examsStore
        .query(
          finder: Finder(
            filter: Filter.equals('license', license.name),
          ),
        )
        .onSnapshots(db);

    return recordSnapshotStream.map((snapshot) {
      return [
        for (final record in snapshot) Exam.fromJson(record.value),
      ];
    });
  }
}