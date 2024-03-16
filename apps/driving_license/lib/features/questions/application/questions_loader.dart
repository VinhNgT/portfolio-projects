import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';

abstract class QuestionsLoader {
  FutureOr<Question> load(int questionIndex);
  FutureOr<List<Question>> loadPage(int pageIndex);
  FutureOr<int> loadQuestionCount();
}

class FullQuestionsLoader implements QuestionsLoader {
  FullQuestionsLoader({required this.questionRepository});
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

class ChapterQuestionsLoader implements QuestionsLoader {
  ChapterQuestionsLoader({
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

class WrongAnswerQuestionsLoader implements QuestionsLoader {
  WrongAnswerQuestionsLoader({
    required this.questionRepository,
    required this.wrongAnswers,
  });
  final QuestionRepository questionRepository;
  final List<UserAnswer> wrongAnswers;

  @override
  FutureOr<Question> load(int questionIndex) {
    return questionRepository
        .getQuestionByDbIndex(wrongAnswers[questionIndex].questionDbIndex);
  }

  @override
  FutureOr<List<Question>> loadPage(int pageIndex) {
    final wrongQuestionDbIndexes =
        wrongAnswers.map((e) => e.questionDbIndex).toList();

    return questionRepository.getQuestionsPageByDbIndexes(
      wrongQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> loadQuestionCount() {
    return Future.value(wrongAnswers.length);
  }
}
