import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketing_questions/presentation/ui/pages/home.dart';
import 'package:marketing_questions/presentation/ui/pages/login.dart';
import 'package:marketing_questions/presentation/ui/pages/question.dart';
import 'package:marketing_questions/presentation/ui/pages/answer.dart';
import 'package:marketing_questions/presentation/ui/pages/commentary.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          // LoginPage.routeName: (_) => LoginPage(),
          // HomePage.routeName: (_) => HomePage(),
          // TODO: login機能を作り直す段階で切り替える
          LoginPage.routeName: (_) => HomePage(),
          QuestionPage.routeName: (_) => QuestionPage(),
          AnswerPage.routeName: (_) => AnswerPage(),
          CommentaryPage.routeName: (_) => CommentaryPage(),
        });
  }
}
