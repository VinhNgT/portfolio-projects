import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/data/question/k_test_questions.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteQuestionsRepository implements QuestionsRepository {
  final Database database;
  SqliteQuestionsRepository(this.database);

  static Future<SqliteQuestionsRepository> makeDefault() async {
    return SqliteQuestionsRepository(await _initDatabase());
  }

  static Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'questions.db');

    // Check if the database exists
    final exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      debugPrint('Creating new copy from asset');

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      final ByteData data =
          await rootBundle.load(join('assets', 'questions.db'));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint('Opening existing database');
    }
    // open the database
    return openDatabase(path, readOnly: true);
  }

  @override
  Future<Question> getQuestion(int index) async {
    return getQuestionByDbIndex(index + 1);
  }

  @override
  Future<int> getQuestionCount() async {
    final List<Map<String, dynamic>> queryResult =
        await database.rawQuery('SELECT COUNT(*) AS count FROM question');
    return queryResult.first['count'] as int;
  }

  @override
  Future<List<Question>> getQuestionsPage(int pageNumber) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      orderBy: 'question_index ASC',
      limit: QuestionsRepository.pageSize,
      offset: pageNumber * QuestionsRepository.pageSize,
    );

    return [
      for (final questionMap in queryResult)
        Question.fromJson(convertDatabaseMapToQuestionObjectMap(questionMap)),
    ];
  }

  @override
  Future<Question> getQuestionByChapter(Chapter chapter, int index) async {
    final chapterQuestionOffset = await database
        .query(
          'question',
          where: 'chapter_index = ?',
          whereArgs: [chapter.chapterDbIndex],
          orderBy: 'question_index ASC',
          limit: 1,
        )
        .then((value) => value.first['question_index'] as int);

    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'chapter_index = ? AND question_index = ?',
      whereArgs: [chapter.chapterDbIndex, chapterQuestionOffset + index],
    );

    if (queryResult.isNotEmpty) {
      final questionMap =
          convertDatabaseMapToQuestionObjectMap(queryResult.first);
      return Question.fromJson(questionMap);
    } else {
      throw Exception('question_index ${index + 1} not found');
    }
  }

  @override
  Future<List<Question>> getQuestionsPageByChapter(
    Chapter chapter,
    int pageNumber,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'chapter_index = ?',
      whereArgs: [chapter.chapterDbIndex],
      orderBy: 'question_index ASC',
      limit: QuestionsRepository.pageSize,
      offset: pageNumber * QuestionsRepository.pageSize,
    );

    return [
      for (final questionMap in queryResult)
        Question.fromJson(convertDatabaseMapToQuestionObjectMap(questionMap)),
    ];
  }

  @override
  Future<int> getQuestionCountByChapter(Chapter chapter) async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE chapter_index = ?',
      [chapter.chapterDbIndex],
    );
    return queryResult.first['count'] as int;
  }

  @override
  FutureOr<Question> getIsDangerQuestion(int index) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_danger = 1',
      orderBy: 'question_index ASC',
      offset: index,
      limit: 1,
    );

    if (queryResult.isNotEmpty) {
      final questionMap =
          convertDatabaseMapToQuestionObjectMap(queryResult.first);
      return Question.fromJson(questionMap);
    } else {
      throw Exception('is_danger question_index $index not found');
    }
  }

  @override
  FutureOr<List<Question>> getIsDangerQuestionsPage(int pageNumber) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_danger = 1',
      orderBy: 'question_index ASC',
      limit: QuestionsRepository.pageSize,
      offset: pageNumber * QuestionsRepository.pageSize,
    );

    return [
      for (final questionMap in queryResult)
        Question.fromJson(convertDatabaseMapToQuestionObjectMap(questionMap)),
    ];
  }

  @override
  FutureOr<int> getIsDangerQuestionsCount() async {
    final List<Map<String, dynamic>> queryResult = await database
        .rawQuery('SELECT COUNT(*) AS count FROM question WHERE is_danger = 1');
    return queryResult.first['count'] as int;
  }

  @override
  FutureOr<Question> getIsDifficultQuestion(int index) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_difficult = 1',
      orderBy: 'question_index ASC',
      offset: index,
      limit: 1,
    );

    if (queryResult.isNotEmpty) {
      final questionMap =
          convertDatabaseMapToQuestionObjectMap(queryResult.first);
      return Question.fromJson(questionMap);
    } else {
      throw Exception('is_difficult question_index $index not found');
    }
  }

  @override
  FutureOr<List<Question>> getIsDifficultQuestionsPage(int pageNumber) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_difficult = 1',
      orderBy: 'question_index ASC',
      limit: QuestionsRepository.pageSize,
      offset: pageNumber * QuestionsRepository.pageSize,
    );

    return [
      for (final questionMap in queryResult)
        Question.fromJson(convertDatabaseMapToQuestionObjectMap(questionMap)),
    ];
  }

  @override
  FutureOr<int> getIsDifficultQuestionsCount() async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE is_difficult = 1',
    );
    return queryResult.first['count'] as int;
  }

  @override
  Future<Question> getQuestionByDbIndex(int dbIndex) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'question_index = ?',
      whereArgs: [dbIndex],
    );

    if (queryResult.isNotEmpty) {
      final questionMap =
          convertDatabaseMapToQuestionObjectMap(queryResult.first);
      return Question.fromJson(questionMap);
    } else {
      throw Exception('question_index $dbIndex not found');
    }
  }

  @override
  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'question_index IN (${dbIndexes.join(', ')})',
      orderBy: 'question_index ASC',
      limit: QuestionsRepository.pageSize,
      offset: pageNumber * QuestionsRepository.pageSize,
    );

    return [
      for (final questionMap in queryResult)
        Question.fromJson(convertDatabaseMapToQuestionObjectMap(questionMap)),
    ];
  }
}

extension QuestionsRepositoryX on QuestionsRepository {
  Map<String, dynamic> convertDatabaseMapToQuestionObjectMap(
    Map<String, dynamic> databaseMap,
  ) {
    return {
      'questionDbIndex': databaseMap['question_index'],
      'chapterDbIndex': databaseMap['chapter_index'],
      'title': databaseMap['question_text'],
      'questionImagePath': databaseMap['question_image'] == null
          ? null
          : join('assets/images', databaseMap['question_image']),
      'answers': jsonDecode(databaseMap['answers']),
      'correctAnswerIndex': databaseMap['correct_index'] - 1,
      'isDanger': databaseMap['is_danger'] == 1,
      'isDifficult': databaseMap['is_difficult'] == 1,
      'explanation': kTestQuestions[0].explanation,
      'rememberTip': kTestQuestions[0].rememberTip,
    };
  }
}
