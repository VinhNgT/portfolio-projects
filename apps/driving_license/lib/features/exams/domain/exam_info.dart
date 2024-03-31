import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';

class ExamInfo {
  const ExamInfo({
    required this.examQuestionsCount,
    required this.minimumPassingScore,
    required this.examDurationInMinutes,
    required this.examStructure,
  });

  final int examQuestionsCount;
  final int minimumPassingScore;
  final int examDurationInMinutes;
  final ExamStructure examStructure;
}

class ExamStructure {
  const ExamStructure({
    required this.dangerQuestionsCount,
    required this.chaptersInfo,
  });

  final int dangerQuestionsCount;
  final Map<Chapter, ChapterExamInfo> chaptersInfo;
}

class ChapterExamInfo {
  const ChapterExamInfo({
    required this.chapterQuestionsCount,
    this.isInPool = false,
  });

  final int chapterQuestionsCount;
  final bool isInPool;
}

class SubChapterExamInfo extends ChapterExamInfo {
  const SubChapterExamInfo({
    required this.subChapterQuestionsCount,
  }) : super(
          chapterQuestionsCount: 0,
          isInPool: false,
        );

  final Map<SubChapter, int> subChapterQuestionsCount;

  @override
  int get chapterQuestionsCount =>
      subChapterQuestionsCount.values.fold(0, (a, b) => a + b);
}
