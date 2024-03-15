import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

part 'user_answer_repository.g.dart';

class UserAnswerRepository {
  UserAnswerRepository(this.db);

  final Database db;
  final store = intMapStoreFactory.store('user_answers');

  static Future<UserAnswerRepository> makeDefault() async {
    return UserAnswerRepository(await _createDatabase('user_answers.db'));
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }

  Future<void> saveUserAnswer(
    int questionDbIndex,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionIndex: questionDbIndex,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    await store.record(questionDbIndex).put(db, userAnswer.toJson());
  }

  Future<void> deleteUserAnswer(int questionDbIndex) async {
    await store.record(questionDbIndex).delete(db);
  }

  Future<void> deleteAllUserAnswers() async {
    await store.delete(db);
  }

  Stream<int?> watchUserSelectedAnswerIndex(int questionDbIndex) {
    final recordSnapshot = store.record(questionDbIndex).onSnapshot(db);

    return recordSnapshot.map((snapshot) {
      if (snapshot == null) {
        return null;
      }

      final userAnswerJson = snapshot.value as Map<String, dynamic>;
      final userAnswer = UserAnswer.fromJson(userAnswerJson);
      return userAnswer.selectedAnswerIndex;
    });
  }
}

@Riverpod(keepAlive: true)
UserAnswerRepository userAnswerRepository(UserAnswerRepositoryRef ref) {
  //* Override this in the main method to select the correct implementation
  throw UnimplementedError();
}

@riverpod
Stream<int?> userSelectedAnswerIndex(
  UserSelectedAnswerIndexRef ref,
  int questionDbIndex,
) {
  final userAnswerRepository = ref.watch(userAnswerRepositoryProvider);
  return userAnswerRepository.watchUserSelectedAnswerIndex(questionDbIndex);
}
