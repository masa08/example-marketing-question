import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/presentation/notifier/category.dart';
import 'package:marketing_questions/presentation/ui/pages/question.dart';
import 'package:marketing_questions/presentation/ui/pages/sub_category.dart';

class HomePage extends HookWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/home';

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final _categoryProvider = useProvider(categoryProvider);
    _categoryProvider.getTheoryCategories();
    _categoryProvider.getPracticalCategories();
    final theoryCategories = _categoryProvider.theoryCatories;
    final practicalCategories = _categoryProvider.practiceCategories;

    return Scaffold(
      appBar: AppBar(
        title: Text("CATEGORY PAGE(進捗と問題集)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '[理論編]',
            ),
            ...theoryCategories.map<Widget>((category) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SubCategoryPage.routeName,
                      arguments: category.id);
                },
                child: Text("${category.title}"),
              );
            }),
            Text(
              '[実践編]',
            ),
            ...practicalCategories.map<Widget>((category) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SubCategoryPage.routeName,
                      arguments: category.id);
                },
                child: Text("${category.title}"),
              );
            })
          ],
        ),
      ),
    );
  }
}
