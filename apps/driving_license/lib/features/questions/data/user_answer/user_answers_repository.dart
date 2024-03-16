import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

part 'user_answers_repository.g.dart';

class UserAnswersRepository {
  UserAnswersRepository(this.db);

  final Database db;
  final allAnswersStore = intMapStoreFactory.store('all_answers');
  final answeredWrongStore = intMapStoreFactory.store('answered_wrong');

  static Future<UserAnswersRepository> makeDefault() async {
    return UserAnswersRepository(await _createDatabase('user_answers.db'));
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionDbIndex: question.questionDbIndex,
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
      }
    });
  }

  Future<void> deleteUserAnswer(Question question) async {
    await allAnswersStore.record(question.questionDbIndex).delete(db);
    await answeredWrongStore.record(question.questionDbIndex).delete(db);
  }

  Future<void> deleteAllUserAnswers() async {
    await allAnswersStore.delete(db);
    await answeredWrongStore.delete(db);
  }

  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    final recordSnapshot =
        allAnswersStore.record(question.questionDbIndex).onSnapshot(db);

    return recordSnapshot.map((snapshot) {
      if (snapshot == null) {
        return null;
      }

      final userAnswerJson = snapshot.value as Map<String, dynamic>;
      final userAnswer = UserAnswer.fromJson(userAnswerJson);
      return userAnswer.selectedAnswerIndex;
    });
  }

  Stream<List<UserAnswer>> watchAllWrongAnswers() {
    final recordSnapshot = answeredWrongStore.query().onSnapshots(db);

    return recordSnapshot.map((snapshot) {
      return snapshot
          .map((e) => UserAnswer.fromJson(e.value as Map<String, dynamic>))
          .toList();
    });
  }

  Future<List<UserAnswer>> getAllWrongAnswers() {
    return answeredWrongStore.find(db).then((records) {
      return records
          .map((e) => UserAnswer.fromJson(e.value as Map<String, dynamic>))
          .toList();
    });
  }
}

@Riverpod(keepAlive: true)
UserAnswersRepository userAnswersRepository(UserAnswersRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}
