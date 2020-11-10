import 'package:flutter/material.dart';
import 'package:marketing_questions/presentation/ui/pages/answer.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({Key key}) : super(key: key);

  static const routeName = '/question';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("QUESTION PAGE(問題一覧)"),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AnswerPage.routeName);
          },
          child: Card(
            child: (Text('マーケティングの歴史')),
          ),
        ));
  }
}
