import 'package:flutter/material.dart';
import 'package:marketing_questions/presentation/ui/pages/commentary.dart';

class AnswerPage extends StatelessWidget {
  AnswerPage({Key key}) : super(key: key);

  static const routeName = '/answer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ANSWER PAGE(回答)"),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CommentaryPage.routeName);
              },
              child: Card(
                child: (Text('answer1')),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CommentaryPage.routeName);
              },
              child: Card(
                child: (Text('answer2')),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CommentaryPage.routeName);
              },
              child: Card(
                child: (Text('answer3')),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CommentaryPage.routeName);
              },
              child: Card(
                child: (Text('answer4')),
              ),
            ),
          ],
        ));
  }
}
