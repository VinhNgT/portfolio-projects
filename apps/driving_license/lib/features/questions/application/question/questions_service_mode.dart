import 'package:driving_license/features/chapters/domain/chapter.dart';

sealed class QuestionsServiceMode {}

class FullOperatingMode extends QuestionsServiceMode {}

class ChapterOperatingMode extends QuestionsServiceMode {
  final Chapter chapter;
  ChapterOperatingMode(this.chapter);
}

class DangerOperatingMode extends QuestionsServiceMode {}

class DifficultOperatingMode extends QuestionsServiceMode {}

class WrongAnswersOperatingMode extends QuestionsServiceMode {}

class BookmarkOperatingMode extends QuestionsServiceMode {}
