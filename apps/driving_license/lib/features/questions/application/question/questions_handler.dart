import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';

abstract class QuestionsHandler {
  FutureOr<Question> getQuestion(int questionIndex);
  FutureOr<List<Question>> getQuestionsPage(int pageIndex);
  FutureOr<int> getQuestionCount();
}

class FullQuestionsHandler implements QuestionsHandler {
  FullQuestionsHandler({required this.questionRepository});
  final QuestionRepository questionRepository;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionRepository.getQuestion(questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionRepository.getQuestionsPage(pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionRepository.getQuestionCount();
  }
}

class ChapterQuestionsHandler implements QuestionsHandler {
  ChapterQuestionsHandler({
    required this.questionRepository,
    required this.chapter,
  });
  final QuestionRepository questionRepository;
  final Chapter chapter;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionRepository.getQuestionByChapter(chapter, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionRepository.getQuestionsPageByChapter(chapter, pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionRepository.getQuestionCountByChapter(chapter);
  }
}

class WrongAnswerQuestionsHandler implements QuestionsHandler {
  WrongAnswerQuestionsHandler({
    required this.questionRepository,
    required this.wrongAnswers,
  });
  final QuestionRepository questionRepository;
  final List<UserAnswer> wrongAnswers;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionRepository
        .getQuestionByDbIndex(wrongAnswers[questionIndex].questionDbIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    final wrongQuestionDbIndexes =
        wrongAnswers.map((e) => e.questionDbIndex).toList();

    return questionRepository.getQuestionsPageByDbIndexes(
      wrongQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return Future.value(wrongAnswers.length);
  }
}
