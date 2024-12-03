import 'package:drift/drift.dart';

class CartTable extends Table {
  IntColumn get id => integer().autoIncrement()();
}
