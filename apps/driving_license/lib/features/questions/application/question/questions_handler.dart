import 'dart:async';

import 'package:collection/collection.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';

abstract class QuestionsHandler {
  FutureOr<Question> getQuestion(int questionIndex);
  FutureOr<List<Question>> getQuestionsPage(int pageIndex);
  FutureOr<int> getQuestionCount();
}

class FullQuestionsHandler implements QuestionsHandler {
  FullQuestionsHandler({required this.questionsRepository});
  final QuestionsRepository questionsRepository;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionCount();
  }
}

class ChapterQuestionsHandler implements QuestionsHandler {
  ChapterQuestionsHandler({
    required this.questionsRepository,
    required this.chapter,
  });
  final QuestionsRepository questionsRepository;
  final Chapter chapter;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestionByChapter(chapter, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPageByChapter(chapter, pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionCountByChapter(chapter);
  }
}

class WrongAnswerQuestionsHandler implements QuestionsHandler {
  WrongAnswerQuestionsHandler({
    required this.questionsRepository,
    required this.wrongAnswers,
  }) {
    _wrongAnswersList = wrongAnswers.values
        .toList()
        .sorted((a, b) => a.questionDbIndex - b.questionDbIndex);
  }
  final QuestionsRepository questionsRepository;
  final UserAnswersMap wrongAnswers;
  late final List<UserAnswer> _wrongAnswersList;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository
        .getQuestionByDbIndex(_wrongAnswersList[questionIndex].questionDbIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    final wrongQuestionDbIndexes =
        _wrongAnswersList.map((answer) => answer.questionDbIndex).toList();

    return questionsRepository.getQuestionsPageByDbIndexes(
      wrongQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return Future.value(wrongAnswers.length);
  }
}
