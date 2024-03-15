import 'dart:async';

import 'package:driving_license/features/chapters/data/user_chapter_selection_repository.dart';
import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

abstract class QuestionLoader {
  FutureOr<Question> load(int questionIndex);
  FutureOr<List<Question>> loadPage(int pageIndex);
  FutureOr<int> loadQuestionCount();
}

class FullQuestionLoader implements QuestionLoader {
  FullQuestionLoader({required this.questionRepository});
  final QuestionRepository questionRepository;

  @override
  FutureOr<Question> load(int questionIndex) {
    return questionRepository.getQuestion(questionIndex);
  }

  @override
  FutureOr<List<Question>> loadPage(int pageIndex) {
    return questionRepository.getQuestionsPage(pageIndex);
  }

  @override
  FutureOr<int> loadQuestionCount() {
    return questionRepository.getQuestionCount();
  }
}

class ChapterQuestionLoader implements QuestionLoader {
  ChapterQuestionLoader({
    required this.questionRepository,
    required this.chapter,
  });
  final QuestionRepository questionRepository;
  final Chapter chapter;

  @override
  FutureOr<Question> load(int questionIndex) {
    return questionRepository.getQuestionByChapter(chapter, questionIndex);
  }

  @override
  FutureOr<List<Question>> loadPage(int pageIndex) {
    return questionRepository.getQuestionsPageByChapter(chapter, pageIndex);
  }

  @override
  FutureOr<int> loadQuestionCount() {
    return questionRepository.getQuestionCountByChapter(chapter);
  }
}
