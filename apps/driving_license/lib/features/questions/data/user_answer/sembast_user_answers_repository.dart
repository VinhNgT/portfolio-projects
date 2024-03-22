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

  static Future<SembastUserAnswersRepository> makeDefault() async {
    return SembastUserAnswersRepository(
      await _createDatabase('user_answers.db'),
    );
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  Filter get _wrongAnswersFilter {
    return Filter.custom((record) {
      final correctAnswerIndex = record['questionMetadata.correctAnswerIndex'];
      final selectedAnswerIndex = record['selectedAnswerIndex'];
      return correctAnswerIndex != selectedAnswerIndex;
    });
  }

  Filter _filterByChapter(Chapter chapter) {
    return Filter.equals(
      'questionMetadata.chapterDbIndex',
      chapter.chapterDbIndex,
    );
  }

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionMetadata: question.metadata,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    await allAnswersStore
        .record(question.questionDbIndex)
        .put(db, userAnswer.toJson());
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    await allAnswersStore.record(question.questionDbIndex).delete(db);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    await allAnswersStore.delete(db);
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
    final recordSnapshot = await allAnswersStore.find(
      db,
      finder: Finder(filter: _wrongAnswersFilter),
    );

    return {
      for (final record in recordSnapshot)
        record.key: UserAnswer.fromJson(record.value as Map<String, dynamic>),
    };
  }

  @override
  Stream<int> watchChapterAnswersCount(Chapter chapter) {
    final userAnswersCountStream = allAnswersStore
        .query(finder: Finder(filter: _filterByChapter(chapter)))
        .onCount(db);

    return userAnswersCountStream;
  }

  @override
  Stream<int> watchChapterWrongAnswersCount(Chapter chapter) {
    final wrongUserAnswersCountStream = allAnswersStore
        .query(finder: Finder(filter: _wrongAnswersFilter))
        .onCount(db);

    return wrongUserAnswersCountStream;
  }
}
