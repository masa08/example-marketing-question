import 'package:marketing_questions/infrastructure/sqlite/schema.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteQuery {
  Database _database;

  Future initialize() async {
    _database = await openSqfliteDatabase();
  }

  Future<List<Map<String, String>>> select(String query) async {
    try {
      final resultSqflite = await _database.rawQuery(query);
      final result = <Map<String, String>>[];

      for (final row in resultSqflite) {
        result.add(row.map<String, String>((String key, dynamic value) {
          return MapEntry(key, value as String);
        }));
      }
      return result;
    } on DatabaseException catch (e) {
      print('select error: \n $query');
      print(e);
      rethrow;
    }
  }
}
