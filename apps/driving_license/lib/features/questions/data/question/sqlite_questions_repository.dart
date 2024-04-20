import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// This value must match the PRAGMA user_version of the database in the assets
/// otherwise an Exception will be thrown
const _dataBaseUserVersionConst = 3;

class SqliteQuestionsRepository implements QuestionsRepository {
  final Database database;
  SqliteQuestionsRepository(this.database);

  @factory
  static Future<SqliteQuestionsRepository> makeDefault() async {
    return SqliteQuestionsRepository(await _initDatabase());
  }

  static Future<Database> _initDatabase() async {
    final databasesDir = await getDatabasesPath();
    final dbPath = join(databasesDir, 'questions.db');

    // Check if the database exists
    final exists = await databaseExists(dbPath);

    // If the database doesn't exist, create a new copy from the asset
    if (!exists) {
      debugPrint(
        'Database does not exist, creating new database copy from asset',
      );
      await _createNewDbFromAsset(dbPath);
      return openDatabase(dbPath, readOnly: true);
    }

    // Check if the database is outdated
    final userVersion = await _getDbUserVersion(dbPath);
    if (userVersion != _dataBaseUserVersionConst) {
      debugPrint(
        'Existing database is outdated, creating new database copy '
        'from asset',
      );
      await _createNewDbFromAsset(dbPath);
      return openDatabase(dbPath, readOnly: true);
    }

    // Open the database
    debugPrint('Opening existing database');
    return openDatabase(dbPath, readOnly: true);
  }

  static Future<int> _getDbUserVersion(String dbPath) async {
    final db = await openDatabase(dbPath, readOnly: true);
    final version = await db.getVersion();
    await db.close();
    return version;
  }

  static Future<void> _createNewDbFromAsset(String dbPath) async {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (_) {
      debugPrint('Failed to create database directory');
    }

    // Delete the old database if it exists
    if (await File(dbPath).exists()) {
      await File(dbPath).delete();
    }

    // Copy from asset
    final ByteData data = await rootBundle.load(join('assets', 'questions.db'));
    final List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(dbPath).writeAsBytes(bytes, flush: true);

    // Check the user_version of the database
    final dbVersion = await _getDbUserVersion(dbPath);
    if (_dataBaseUserVersionConst == -1) {
      // If _dataBaseUserVersionConst is -1, then a new copy of the database
      // will be created from the asset every time the app is started
      // (for development purposes)
      return;
    }

    if (dbVersion != _dataBaseUserVersionConst) {
      throw Exception('The database\'s user_version from asset does not match '
          'the expected value \'$_dataBaseUserVersionConst\'');
    }
  }

  @override
  Future<Question> getQuestion(int index, {bool isDbIndex = false}) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'question_index = ?',
      whereArgs: [isDbIndex ? index : index + 1],
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
  Future<int> getQuestionsCount() async {
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
  Future<Question> getQuestionByLicenseAndChapter(
    License license,
    Chapter chapter,
    int index,
  ) async {
    final queryResult = await database.query(
      'question',
      where: 'chapter_index = ?'._addLicenseWhereClause(license),
      whereArgs: [chapter.chapterDbIndex],
      orderBy: 'question_index ASC',
      offset: index,
      limit: 1,
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
  Future<List<Question>> getQuestionsPageByLicenseAndChapter(
    License license,
    Chapter chapter,
    int pageNumber,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'chapter_index = ?'._addLicenseWhereClause(license),
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
  Future<int> getQuestionsCountByLicenseAndChapter(
    License license,
    Chapter chapter,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE '
      '${'chapter_index = ?'._addLicenseWhereClause(license)}',
      [chapter.chapterDbIndex],
    );
    return queryResult.first['count'] as int;
  }

  @override
  Future<Iterable<int>> getQuestionDbIndexesByLicenseAndChapter(
    License license,
    Chapter chapter, {
    bool skipIsDanger = false,
  }) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      columns: ['question_index'],
      where: 'chapter_index = ?'
          ._addLicenseWhereClause(license)
          ._addSkipIsDangerClause(skipIsDanger),
      whereArgs: [chapter.chapterDbIndex],
      orderBy: 'question_index ASC',
    );

    return queryResult.map((e) => e['question_index'] as int);
  }

  @override
  Future<Iterable<int>> getQuestionDbIndexesByLicenseAndSubChapter(
    License license,
    SubChapter chapter, {
    bool skipIsDanger = false,
  }) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      columns: ['question_index'],
      where: 'sub_chapter_index = ?'
          ._addLicenseWhereClause(license)
          ._addSkipIsDangerClause(skipIsDanger),
      whereArgs: [chapter.subChapterDbIndex],
      orderBy: 'question_index ASC',
    );

    return queryResult.map((e) => e['question_index'] as int);
  }

  @override
  Future<Question> getIsDangerQuestionByLicense(
    License license,
    int index,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_danger = 1'._addLicenseWhereClause(license),
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
  Future<List<Question>> getIsDangerQuestionsPageByLicense(
    License license,
    int pageNumber,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_danger = 1'._addLicenseWhereClause(license),
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
  Future<int> getIsDangerQuestionsCountByLicense(License license) async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE '
      '${'is_danger = 1'._addLicenseWhereClause(license)}',
    );
    return queryResult.first['count'] as int;
  }

  @override
  Future<Iterable<int>> getIsDangerQuestionDbIndexesByLicense(
    License license,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      columns: ['question_index'],
      where: 'is_danger = 1'._addLicenseWhereClause(license),
      orderBy: 'question_index ASC',
    );

    return queryResult.map((e) => e['question_index'] as int);
  }

  @override
  Future<Question> getIsDifficultQuestionByLicense(
    License license,
    int index,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_difficult = 1'._addLicenseWhereClause(license),
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
  Future<List<Question>> getIsDifficultQuestionsPageByLicense(
    License license,
    int pageNumber,
  ) async {
    final List<Map<String, dynamic>> queryResult = await database.query(
      'question',
      where: 'is_difficult = 1'._addLicenseWhereClause(license),
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
  Future<int> getIsDifficultQuestionsCountByLicense(License license) async {
    final List<Map<String, dynamic>> queryResult = await database.rawQuery(
      'SELECT COUNT(*) AS count FROM question WHERE '
      '${'is_difficult = 1'._addLicenseWhereClause(license)}',
    );
    return queryResult.first['count'] as int;
  }

  @override
  Future<List<Question>> getQuestionsPageByDbIndexes(
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
      'subChapterDbIndex': databaseMap['sub_chapter_index'],
      'title': databaseMap['question_text'],
      'questionImagePath': databaseMap['question_image'] == null
          ? null
          : join('assets/images', databaseMap['question_image']),
      'answers': jsonDecode(databaseMap['answers']),
      'correctAnswerIndex': databaseMap['correct_index'] - 1,
      'isDanger': databaseMap['is_danger'] == 1,
      'isDifficult': databaseMap['is_difficult'] == 1,
      // Replace all '\\n' with '\n', also remove all spaces before '\n'
      'explanation': (databaseMap['explanation'] as String?)
          ?.replaceAll(RegExp(r'\s*\\n'), '\n'),
      'rememberTip': databaseMap['remember_tip'],
      'includedLicenses': [
        for (final license in License.values)
          if (databaseMap['is_in_${license.name}'] == 1) license.name,
      ],
    };
  }
}

extension _WhereClauseExtenstion on String {
  String _addLicenseWhereClause(License license) {
    if (license == License.all) {
      return this;
    }
    return '($this) AND is_in_${license.name} = 1';
  }

  String _addSkipIsDangerClause(bool skipIsDanger) {
    if (!skipIsDanger) {
      return this;
    }
    return '($this) AND is_danger IS NULL';
  }
}
