import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/infrastructure/get_it/main.dart';
import 'package:marketing_questions/presentation/ui/pages/home.dart';
import 'package:marketing_questions/presentation/ui/pages/login.dart';
import 'package:marketing_questions/presentation/ui/pages/question.dart';
import 'package:marketing_questions/presentation/ui/pages/answer.dart';
import 'package:marketing_questions/presentation/ui/pages/commentary.dart';
import 'package:marketing_questions/presentation/ui/pages/sub_category.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UseDIContainer(
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            // LoginPage.routeName: (_) => LoginPage(),
            // HomePage.routeName: (_) => HomePage(),
            // TODO: login機能を作り直す段階で切り替える
            LoginPage.routeName: (_) => HomePage(),
            SubCategoryPage.routeName: (_) => SubCategoryPage(),
            QuestionPage.routeName: (_) => QuestionPage(),
            AnswerPage.routeName: (_) => AnswerPage(),
            CommentaryPage.routeName: (_) => CommentaryPage(),
          }),
    );
  }
}

class UseDIContainer extends StatefulWidget {
  const UseDIContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _UseDIContainerState createState() => _UseDIContainerState();
}

class _UseDIContainerState extends State<UseDIContainer> {
  bool _alreadyRegister = false;

  @override
  void initState() {
    super.initState();
    registerDIContainers().then((bool result) {
      setState(() => _alreadyRegister = result);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_alreadyRegister) {
      return widget.child;
    }
    return Container();
  }
}
