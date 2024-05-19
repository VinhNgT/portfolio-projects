import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/in_memory_user_answers_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';

class QuestionsServiceConfig {

  QuestionsServiceConfig({
    required this.operatingMode,
    required this.license,
    required this.questionsRepository,
    required this.bookmarksRepository,
    required this.userAnswersRepository,
    required this.inMemoryUserAnswersRepository,
  });
  final QuestionsServiceMode operatingMode;
  final License license;
  final QuestionsRepository questionsRepository;
  final BookmarksRepository bookmarksRepository;
  final UserAnswersRepository userAnswersRepository;
  final InMemoryUserAnswersRepository inMemoryUserAnswersRepository;
}
