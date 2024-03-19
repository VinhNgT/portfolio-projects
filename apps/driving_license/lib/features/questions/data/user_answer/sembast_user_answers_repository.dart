import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastUserAnswersRepository implements UserAnswersRepository {
  SembastUserAnswersRepository(this.db);

  final Database db;
  final allAnswersStore = intMapStoreFactory.store('all_answers');
  final answeredWrongStore = intMapStoreFactory.store('answered_wrong');

  static Future<SembastUserAnswersRepository> makeDefault() async {
    return SembastUserAnswersRepository(
      await _createDatabase('user_answers.db'),
    );
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionDbIndex: question.questionDbIndex,
      chapterDbIndex: question.chapterDbIndex,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    await db.transaction((txn) async {
      await allAnswersStore
          .record(question.questionDbIndex)
          .put(txn, userAnswer.toJson());

      if (question.correctAnswerIndex != selectedAnswerIndex) {
        await answeredWrongStore
            .record(question.questionDbIndex)
            .put(txn, userAnswer.toJson());
      } else {
        await answeredWrongStore.record(question.questionDbIndex).delete(txn);
      }
    });
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    await allAnswersStore.record(question.questionDbIndex).delete(db);
    await answeredWrongStore.record(question.questionDbIndex).delete(db);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    await allAnswersStore.delete(db);
    await answeredWrongStore.delete(db);
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    final recordSnapshotStream =
        allAnswersStore.record(question.questionDbIndex).onSnapshot(db);

    return recordSnapshotStream.map((snapshot) {
      if (snapshot == null) {
        return null;
      }

      final userAnswerJson = snapshot.value as Map<String, dynamic>;
      final userAnswer = UserAnswer.fromJson(userAnswerJson);
      return userAnswer.selectedAnswerIndex;
    });
  }

  @override
  Future<UserAnswersMap> getAllWrongAnswers() async {
    final recordSnapshot = await answeredWrongStore.find(db);

    return {
      for (final record in recordSnapshot)
        record.key: UserAnswer.fromJson(record.value as Map<String, dynamic>),
    };
  }

  @override
  Stream<int> watchChapterAnswersCount(Chapter chapter) {
    final userAnswersCountStream = allAnswersStore
        .query(
          finder: Finder(
            filter: Filter.equals('chapterDbIndex', chapter.chapterDbIndex),
          ),
        )
        .onCount(db);

    return userAnswersCountStream;
  }

  @override
  Stream<int> watchChapterWrongAnswersCount(Chapter chapter) {
    final wrongUserAnswersCountStream = answeredWrongStore
        .query(
          finder: Finder(
            filter: Filter.equals('chapterDbIndex', chapter.chapterDbIndex),
          ),
        )
        .onCount(db);

    return wrongUserAnswersCountStream;
  }
}
