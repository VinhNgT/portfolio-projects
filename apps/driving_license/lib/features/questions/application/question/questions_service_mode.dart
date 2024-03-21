import 'package:driving_license/features/chapters/domain/chapter.dart';

sealed class QuestionsServiceMode {
  String get description;
}

class FullOperatingMode extends QuestionsServiceMode {
  @override
  String get description => 'All 600 questions operating mode';
}

class ChapterOperatingMode extends QuestionsServiceMode {
  final Chapter chapter;
  ChapterOperatingMode(this.chapter);

  @override
  String get description => 'Chapter ${chapter.chapterDbIndex} operating mode';
}

class DangerOperatingMode extends QuestionsServiceMode {
  @override
  String get description => 'All danger questions operating mode';
}

class DifficultOperatingMode extends QuestionsServiceMode {
  @override
  String get description => 'All difficult questions operating mode';
}

class WrongAnswersOperatingMode extends QuestionsServiceMode {
  @override
  String get description => 'All wrong answer questions operating mode';
}

class BookmarkOperatingMode extends QuestionsServiceMode {
  @override
  String get description => 'All user bookmarked questions operating mode';
}
