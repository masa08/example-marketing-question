import 'package:sqflite/sqflite.dart';

Future<Database> openSqfliteDatabase() async {
  print(await getDatabasesPath());
  return openDatabase('mq.db', version: 1,
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
        insert into chapter
          select '1', '理論編'
          union all select '2', '実務編'
        ''');
    await db.execute('''
        insert into category
          select '1', '1', '基礎的なフレームワーク'
          union all select '2', '2', 'KPI'
          union all select '3', '2', 'データ分析'
        ''');
    await db.execute('''
        insert into sub_category
                    select '1', '1', 'サブカテゴリ1'
          union all select '2', '1', 'サブカテゴリ2'
          union all select '3', '1', 'サブカテゴリ3'
          union all select '4', '2', 'サブカテゴリ4'
          union all select '5', '2', 'サブカテゴリ5'
          union all select '6', '2', 'サブカテゴリ6'
          union all select '7', '3', 'サブカテゴリ7'
          union all select '8', '3', 'サブカテゴリ8'
          union all select '9', '3', 'サブカテゴリ9'
        ''');
    await db.execute('''
        insert into question
                    select '1', '1', '1', 'クエスチョン1', '解答解説が入る。'
          union all select '2', '1', '1', 'クエスチョン2', '解答解説が入る。'
          union all select '3', '1', '1', 'クエスチョン3', '解答解説が入る。'
          union all select '4', '1', '2', 'クエスチョン4', '解答解説が入る。'
          union all select '5', '1', '2', 'クエスチョン5', '解答解説が入る。'
          union all select '6', '1', '2', 'クエスチョン6', '解答解説が入る。'
          union all select '7', '1', '3', 'クエスチョン7', '解答解説が入る。'
          union all select '8', '1', '3', 'クエスチョン8', '解答解説が入る。'
          union all select '9', '1', '3', 'クエスチョン9', '解答解説が入る。'
          union all select '10', '2', '4', 'クエスチョン10', '解答解説が入る。'
          union all select '11', '2', '4', 'クエスチョン11', '解答解説が入る。'
          union all select '12', '2', '4', 'クエスチョン12', '解答解説が入る。'
          union all select '13', '2', '5', 'クエスチョン13', '解答解説が入る。'
          union all select '14', '2', '5', 'クエスチョン14', '解答解説が入る。'
          union all select '15', '2', '5', 'クエスチョン15', '解答解説が入る。'
          union all select '16', '2', '6', 'クエスチョン16', '解答解説が入る。'
          union all select '17', '2', '6', 'クエスチョン17', '解答解説が入る。'
          union all select '18', '2', '6', 'クエスチョン18', '解答解説が入る。'
          union all select '19', '3', '7', 'クエスチョン19', '解答解説が入る。'
          union all select '20', '3', '7', 'クエスチョン20', '解答解説が入る。'
          union all select '21', '3', '7', 'クエスチョン21', '解答解説が入る。'
          union all select '22', '3', '8', 'クエスチョン22', '解答解説が入る。'
          union all select '23', '3', '8', 'クエスチョン23', '解答解説が入る。'
          union all select '24', '3', '8', 'クエスチョン24', '解答解説が入る。'
          union all select '25', '3', '9', 'クエスチョン25', '解答解説が入る。'
          union all select '26', '3', '9', 'クエスチョン26', '解答解説が入る。'
          union all select '27', '3', '9', 'クエスチョン27', '解答解説が入る。'
        ''');
    await db.execute('''
        insert into question
                    select '1', '1','クエスチョン1の選択肢1','TRUE'
          union all select '2', '1','クエスチョン1の選択肢2','FALSE'
          union all select '3', '1','クエスチョン1の選択肢3','FALSE'
          union all select '4', '1','クエスチョン1の選択肢4','FALSE'
          union all select '5', '2','クエスチョン2の選択肢1','TRUE'
          union all select '6', '2','クエスチョン2の選択肢2','FALSE'
          union all select '7', '2','クエスチョン2の選択肢3','FALSE'
          union all select '8', '2','クエスチョン2の選択肢4','FALSE'
          union all select '9', '3','クエスチョン3の選択肢1','TRUE'
          union all select '10', '3','クエスチョン3の選択肢2','FALSE'
          union all select '11', '3','クエスチョン3の選択肢3','FALSE'
          union all select '12', '3','クエスチョン3の選択肢4','FALSE'
          union all select '13', '4','クエスチョン4の選択肢1','TRUE'
          union all select '14', '4','クエスチョン4の選択肢2','FALSE'
          union all select '15', '4','クエスチョン4の選択肢3','FALSE'
          union all select '16', '4','クエスチョン4の選択肢4','FALSE'
          union all select '17', '5','クエスチョン5の選択肢1','TRUE'
          union all select '18', '5','クエスチョン5の選択肢2','FALSE'
          union all select '19', '5','クエスチョン5の選択肢3','FALSE'
          union all select '20', '5','クエスチョン5の選択肢4','FALSE'
          union all select '21', '6','クエスチョン6の選択肢1','TRUE'
          union all select '22', '6','クエスチョン6の選択肢2','FALSE'
          union all select '23', '6','クエスチョン6の選択肢3','FALSE'
          union all select '24', '6','クエスチョン6の選択肢4','FALSE'
          union all select '25', '7','クエスチョン7の選択肢1','TRUE'
          union all select '26', '7','クエスチョン7の選択肢2','FALSE'
          union all select '27', '7','クエスチョン7の選択肢3','FALSE'
          union all select '28', '7','クエスチョン7の選択肢4','FALSE'
          union all select '29', '8','クエスチョン8の選択肢1','TRUE'
          union all select '30', '8','クエスチョン8の選択肢2','FALSE'
          union all select '31', '8','クエスチョン8の選択肢3','FALSE'
          union all select '32', '8','クエスチョン8の選択肢4','FALSE'
          union all select '33', '9','クエスチョン9の選択肢1','TRUE'
          union all select '34', '9','クエスチョン9の選択肢2','FALSE'
          union all select '35', '9','クエスチョン9の選択肢3','FALSE'
          union all select '36', '9','クエスチョン9の選択肢4','FALSE'
          union all select '37', '10','クエスチョン10の選択肢1','TRUE'
          union all select '38', '10','クエスチョン10の選択肢2','FALSE'
          union all select '39', '10','クエスチョン10の選択肢3','FALSE'
          union all select '40', '10','クエスチョン10の選択肢4','FALSE'
          union all select '41', '11','クエスチョン11の選択肢1','TRUE'
          union all select '42', '11','クエスチョン11の選択肢2','FALSE'
          union all select '43', '11','クエスチョン11の選択肢3','FALSE'
          union all select '44', '11','クエスチョン11の選択肢4','FALSE'
          union all select '45', '12','クエスチョン12の選択肢1','TRUE'
          union all select '46', '12','クエスチョン12の選択肢2','FALSE'
          union all select '47', '12','クエスチョン12の選択肢3','FALSE'
          union all select '48', '12','クエスチョン12の選択肢4','FALSE'
          union all select '49', '13','クエスチョン13の選択肢1','TRUE'
          union all select '50', '13','クエスチョン13の選択肢2','FALSE'
          union all select '51', '13','クエスチョン13の選択肢3','FALSE'
          union all select '52', '13','クエスチョン13の選択肢4','FALSE'
          union all select '53', '14','クエスチョン14の選択肢1','TRUE'
          union all select '54', '14','クエスチョン14の選択肢2','FALSE'
          union all select '55', '14','クエスチョン14の選択肢3','FALSE'
          union all select '56', '14','クエスチョン14の選択肢4','FALSE'
          union all select '57', '15','クエスチョン15の選択肢1','TRUE'
          union all select '58', '15','クエスチョン15の選択肢2','FALSE'
          union all select '59', '15','クエスチョン15の選択肢3','FALSE'
          union all select '60', '15','クエスチョン15の選択肢4','FALSE'
          union all select '61', '16','クエスチョン16の選択肢1','TRUE'
          union all select '62', '16','クエスチョン16の選択肢2','FALSE'
          union all select '63', '16','クエスチョン16の選択肢3','FALSE'
          union all select '64', '16','クエスチョン16の選択肢4','FALSE'
          union all select '65', '17','クエスチョン17の選択肢1','TRUE'
          union all select '66', '17','クエスチョン17の選択肢2','FALSE'
          union all select '67', '17','クエスチョン17の選択肢3','FALSE'
          union all select '68', '17','クエスチョン17の選択肢4','FALSE'
          union all select '69', '18','クエスチョン18の選択肢1','TRUE'
          union all select '70', '18','クエスチョン18の選択肢2','FALSE'
          union all select '71', '18','クエスチョン18の選択肢3','FALSE'
          union all select '72', '18','クエスチョン18の選択肢4','FALSE'
          union all select '73', '19','クエスチョン19の選択肢1','TRUE'
          union all select '74', '19','クエスチョン19の選択肢2','FALSE'
          union all select '75', '19','クエスチョン19の選択肢3','FALSE'
          union all select '76', '19','クエスチョン19の選択肢4','FALSE'
          union all select '77', '20','クエスチョン20の選択肢1','TRUE'
          union all select '78', '20','クエスチョン20の選択肢2','FALSE'
          union all select '79', '20','クエスチョン20の選択肢3','FALSE'
          union all select '80', '20','クエスチョン20の選択肢4','FALSE'
          union all select '81', '21','クエスチョン21の選択肢1','TRUE'
          union all select '82', '21','クエスチョン21の選択肢2','FALSE'
          union all select '83', '21','クエスチョン21の選択肢3','FALSE'
          union all select '84', '21','クエスチョン21の選択肢4','FALSE'
          union all select '85', '22','クエスチョン22の選択肢1','TRUE'
          union all select '86', '22','クエスチョン22の選択肢2','FALSE'
          union all select '87', '22','クエスチョン22の選択肢3','FALSE'
          union all select '88', '22','クエスチョン22の選択肢4','FALSE'
          union all select '89', '23','クエスチョン23の選択肢1','TRUE'
          union all select '90', '23','クエスチョン23の選択肢2','FALSE'
          union all select '91', '23','クエスチョン23の選択肢3','FALSE'
          union all select '92', '23','クエスチョン23の選択肢4','FALSE'
          union all select '93', '24','クエスチョン24の選択肢1','TRUE'
          union all select '94', '24','クエスチョン24の選択肢2','FALSE'
          union all select '95', '24','クエスチョン24の選択肢3','FALSE'
          union all select '96', '24','クエスチョン24の選択肢4','FALSE'
          union all select '97', '25','クエスチョン25の選択肢1','TRUE'
          union all select '98', '25','クエスチョン25の選択肢2','FALSE'
          union all select '99', '25','クエスチョン25の選択肢3','FALSE'
          union all select '100', '25','クエスチョン25の選択肢4','FALSE'
          union all select '101', '26','クエスチョン26の選択肢1','TRUE'
          union all select '102', '26','クエスチョン26の選択肢2','FALSE'
          union all select '103', '26','クエスチョン26の選択肢3','FALSE'
          union all select '104', '26','クエスチョン26の選択肢4','FALSE'
          union all select '105', '27','クエスチョン27の選択肢1','TRUE'
          union all select '106', '27','クエスチョン27の選択肢2','FALSE'
          union all select '107', '27','クエスチョン27の選択肢3','FALSE'
          union all select '108', '27','クエスチョン27の選択肢4','FALSE'
        ''');
    await db.execute('''
        insert into user
          select '1', 'Masataka Ushijima', 'masataka@example.com'
          union all select '2', 'Takumi Hashimoto', 'takumi@example.com'
          union all select '3', 'Asami Togawa', 'asami@example.com'
        ''');
  });
}
