import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:driving_license/features/chapters/data/user_chapter_selection_repository.dart';
import 'package:driving_license/features/questions/data/k_test_questions.dart';
import 'package:driving_license/features/questions/data/question_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteQuestionRepository implements QuestionRepository {
  final Database database;
  SqliteQuestionRepository(this.database);

  static Future<SqliteQuestionRepository> makeDefault() async {
    return SqliteQuestionRepository(await _initDatabase());
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
    final List<Map<String, dynamic>> maps = await database.query(
      'question',
      where: 'question_index = ?',
      whereArgs: [index + 1],
    );

    if (maps.isNotEmpty) {
      final questionMap = convertDatabaseMapToQuestionObjectMap(maps.first);
      return Question.fromJson(questionMap);
    } else {
      throw Exception('question_index ${index + 1} not found');
    }
  }

  @override
  Future<int> getQuestionCount() async {
    final List<Map<String, dynamic>> result =
        await database.rawQuery('SELECT COUNT(*) AS count FROM question');
    return result.first['count'] as int;
  }

  @override
  Future<List<Question>> getQuestionsPage(int pageNumber) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'question',
      limit: QuestionRepository.pageSize,
      offset: pageNumber * QuestionRepository.pageSize,
    );

    return List.generate(maps.length, (i) {
      final questionMap = convertDatabaseMapToQuestionObjectMap(maps[i]);
      return Question.fromJson(questionMap);
    });
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

    final List<Map<String, dynamic>> maps = await database.query(
      'question',
      where: 'chapter_index = ? AND question_index = ?',
      whereArgs: [chapter.chapterDbIndex, chapterQuestionOffset + index],
    );

    if (maps.isNotEmpty) {
      final questionMap = convertDatabaseMapToQuestionObjectMap(maps.first);
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
    final List<Map<String, dynamic>> maps = await database.query(
      'question',
      where: 'chapter_index = ?',
      whereArgs: [chapter.chapterDbIndex],
      limit: QuestionRepository.pageSize,
      offset: pageNumber * QuestionRepository.pageSize,
    );

    return List.generate(maps.length, (i) {
      final questionMap = convertDatabaseMapToQuestionObjectMap(maps[i]);
      return Question.fromJson(questionMap);
    });
  }

  @override
  Future<int> getQuestionCountByChapter(Chapter chapter) async {
    final List<Map<String, dynamic>> result = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE chapter_index = ?',
      [chapter.chapterDbIndex],
    );
    return result.first['count'] as int;
  }
}

extension QuestionRepositoryX on QuestionRepository {
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
      'isDanger': kTestQuestions[0].isDanger,
      'explanation': kTestQuestions[0].explanation,
      'rememberTip': kTestQuestions[0].rememberTip,
    };
  }
}
