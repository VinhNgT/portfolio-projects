import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/result/domain/test_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chapter_progress_service.g.dart';

class ChapterProgressService {
  final License license;
  final Chapter chapter;
  final UserAnswersRepository userAnswersRepository;
  final QuestionsRepository questionsRepository;
  final SharedPreferences prefs;

  ChapterProgressService({
    required this.license,
    required this.chapter,
    required this.userAnswersRepository,
    required this.questionsRepository,
    required this.prefs,
  });

  Stream<TestResult> watchChapterCompletionStatus() async* {
    final chapterQuestionsCount = await questionsRepository
        .getQuestionsCountByLicenseAndChapter(license, chapter);
    final userAnswersCountStream = userAnswersRepository
        .watchAnswersCountByLicenseAndChapter(license, chapter);
    final wrongUserAnswersCountStream = userAnswersRepository
        .watchWrongAnswersCountByLicenseAndChapter(license, chapter);

    yield* Rx.combineLatest2(
      userAnswersCountStream,
      wrongUserAnswersCountStream,
      (int userAnswersCount, int wrongUserAnswersCount) {
        return TestResult(
          totalQuestions: chapterQuestionsCount,
          answeredQuestions: userAnswersCount,
          correctAnswers: userAnswersCount - wrongUserAnswersCount,
          wrongAnswers: wrongUserAnswersCount,
        );
      },
    );
  }
}

@riverpod
FutureOr<ChapterProgressService> chapterProgressService(
  ChapterProgressServiceRef ref,
  Chapter chapter,
) async {
  final userSelectedLicense =
      await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  final prefs = await SharedPreferences.getInstance();

  return ChapterProgressService(
    license: userSelectedLicense,
    chapter: chapter,
    userAnswersRepository: userAnswersRepository,
    questionsRepository: questionsRepository,
    prefs: prefs,
  );
}
