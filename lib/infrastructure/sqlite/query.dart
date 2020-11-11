import 'package:sqflite/sqflite.dart';

class SqfliteQuery {
  Future initialize() async {
    print(await getDatabasesPath());
    openDatabase('mq.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE chapter (
            id TEXT,
            name TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE category (
            id TEXT,
            chapter_id TEXT,
            title TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE sub_category (
            id TEXT,
            category_id TEXT,
            title TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE question (
            id TEXT,
            category_id TEXT,
            sub_category_id TEXT,
            title TEXT,
            explanation TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE selection (
            id TEXT,
            question_id TEXT,
            content TEXT,
            is_answer TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE user (
            id TEXT,
            name TEXT,
            email TEXT
          )
          ''');
      await db.execute('''
          CREATE TABLE category (
            id TEXT,
            user_id TEXT,
            question_id TEXT,
            result TEXT,
            created_at TEXT
          )
          ''');
      await db.execute('''
        insert into chapter 
          select '1', '理論編'
          union all select '2', '実践編'
        ''');
      await db.execute('''
        insert into category 
          select '1', '1', 'マーケティングの歴史'
          union all select '2', '1', '基礎的なフレームワーク'
          union all select '3', '2', 'データ分析'
        ''');
      await db.execute('''
        insert into category 
          select '1', '1', 'マーケティングの歴史'
          union all select '2', '1', '基礎的なフレームワーク'
          union all select '3', '2', 'データ分析'
        ''');
    });
  }
}
