import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_questions/presentation/ui/pages/question.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/home';

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CATEGORY PAGE(進捗と問題集)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'MQ APP!',
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(QuestionPage.routeName);
              },
              child: Card(
                child: (Text('マーケティングの歴史')),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(QuestionPage.routeName);
              },
              child: Card(
                child: (Text('基礎的なフレームワーク')),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(QuestionPage.routeName);
              },
              child: Card(
                child: (Text('消費者行動論')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
