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
          select '1', '1', '基礎的なフレームワーク'
          union all select '2', '2', '効果測定'
        ''');
    　await db.execute('''
        insert into question 
          select '1', '1', '開拓すべき市場を特定するために用いられるフレームワーク「STP」は何を略したものか。', '解答解説が入る。'
          union all select '2', '1', '「SWOT」はどのような目的で用いられるか。', '解答解説が入る。'
          union all select '3', '1', '「PEST」はどのような目的で用いられるか。', '解答解説が入る。'
          union all select '4', '2', '投資効率を表す指標であるROIの正しい求め方はどれか。', '解答解説が入る。'
          union all select '5', '3', 'ABテストを行って得られた下記のようなデータに対して有意差があったか検定をしたい。適した手法はどれか。', '解答解説が入る。'
          union all select '6', '3', 'p値の説明として適しているものを選べ。', '解答解説が入る。'
        ''');
     await db.execute('''
        insert into selection
          select '1', '1', 'Segmentation, Targeting, Positioning', 'TRUE'
          union all select '2', '1', 'XXX1, XXX2, XXX3', 'FALSE'
          union all select '3', '1', 'YYY1, YYY2, YYY3', 'FALSE'
          union all select '4', '1', 'ZZZ1, ZZZ2, ZZZ3', 'FALSE'
          union all select '5', '2', '自社製品の「強み、弱み、機会、脅威」を分析するため。', 'TRUE'
          union all select '6', '2', 'XXXを分析するため。', 'FALSE'
          union all select '7', '2', 'YYY分析するため。', 'FALSE'
          union all select '8', '2', 'ZZZを分析するため。', 'FALSE'
          union all select '9', '3', '外部環境の分析', 'TRUE'
          union all select '10', '3', 'AAA環境の分析', 'FALSE'
          union all select '11', '3', 'BBB環境の分析', 'FALSE'
          union all select '12', '3', 'CCC環境の分析', 'FALSE'
          union all select '13', '4', '利益/コスト', 'TRUE'
          union all select '14', '4', 'AAA/XXX', 'FALSE'
          union all select '15', '4', 'BBB/YYY', 'FALSE'
          union all select '16', '4', 'CCC/ZZZ', 'FALSE'
          union all select '17', '5', 'カイ二乗検定', 'TRUE'
          union all select '18', '5', 'カイ三乗検定', 'FALSE'
          union all select '19', '5', 'カイ四乗検定', 'FALSE'
          union all select '20', '5', 'カイ五乗検定', 'FALSE'
          union all select '21', '6', '得られた結果がXXXであることを許容する確率。', 'FALSE'
          union all select '22', '6', '得られた結果がYYYであることを許容する確率。', 'FALSE'
          union all select '23', '6', '得られた結果が偶然誤差であることを許容する確率。', 'TRUE'
          union all select '24', '6', '得られた結果がZZZであることを許容する確率。', 'FALSE'
        ''');
    await db.execute('''
        insert into user 
          select '1', 'Masataka Ushijima', 'masataka@example.com'
          union all select '2', 'Takumi Hashimoto', 'takumi@example.com'
          union all select '3', 'Asami Togawa', 'asami@example.com'
        ''');
    });
  }
}
