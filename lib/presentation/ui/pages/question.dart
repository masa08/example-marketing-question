import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/presentation/notifier/question.dart';
import 'package:marketing_questions/presentation/ui/pages/answer.dart';

class QuestionPage extends HookWidget {
  QuestionPage({Key key}) : super(key: key);

  static const routeName = '/question';

  @override
  Widget build(BuildContext context) {
    final subCategoryId = ModalRoute.of(context).settings.arguments;
    final _questionProvider = useProvider(questionProvider);
    _questionProvider.getByCaterogyId(subCategoryId: subCategoryId);
    final questions = _questionProvider.questions;

    return Scaffold(
        appBar: AppBar(
          title: Text("QUESTION PAGE(問題一覧)"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...questions.map<Widget>((question) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AnswerPage.routeName);
                    },
                    child: Card(
                      child: (Text('${question.title}')),
                    ),
                  );
                })
              ]),
        ));
  }
}
