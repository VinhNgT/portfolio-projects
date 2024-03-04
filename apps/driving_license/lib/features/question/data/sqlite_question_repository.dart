import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:driving_license/features/question/data/k_test_questions.dart';
import 'package:driving_license/features/question/data/question_repository.dart';
import 'package:driving_license/features/question/domain/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteQuestionRepository implements QuestionRepository {
  final Database database;
  SqliteQuestionRepository(this.database);

  static Future<SqliteQuestionRepository> createDefaultRepository() async {
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
      // Convert the Map into a format compatible with the Question object
      final Map<String, dynamic> questionMap = {
        'title': maps.first['question_text'],
        'questionImagePath': maps.first['question_image'] == null
            ? null
            : join('assets/images', maps.first['question_image']),
        'answers': jsonDecode(maps.first['answers']),
        'correctAnswerIndex': maps.first['correct_index'] - 1,
        'isDanger': kTestQuestions[0].isDanger,
        'explanation': kTestQuestions[0].explanation,
        'rememberTip': kTestQuestions[0].rememberTip,
      };

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
}
