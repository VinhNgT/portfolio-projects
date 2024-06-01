import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast/sembast_memory.dart';

part 'sembast_provider.g.dart';

class SembastController {
  SembastController(this.database);
  final Database database;

  @factory
  static Future<SembastController> makeDefault() async {
    return SembastController(await _createDatabase('sembast.db'));
  }

  static Future<Database> _createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase(join(appDocDir.path, filename));
  }
}

@Riverpod(keepAlive: true)
Future<Database> sembast(SembastRef ref) async {
  final dbController = await SembastController.makeDefault();

  ref.onDispose(dbController.database.close);
  return dbController.database;
}

@riverpod
Future<Database> inMemorySembast(InMemorySembastRef ref, String dbName) async {
  final dbFactory = newDatabaseFactoryMemory();
  final db = await dbFactory.openDatabase(dbName);

  ref.onDispose(db.close);
  return db;
}
