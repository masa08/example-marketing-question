import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/presentation/notifier/sub_category.dart';
import 'package:marketing_questions/presentation/ui/pages/answer.dart';
import 'package:marketing_questions/presentation/ui/pages/question.dart';

class SubCategoryPage extends HookWidget {
  SubCategoryPage({Key key}) : super(key: key);

  static const routeName = '/sub_category';

  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context).settings.arguments;
    final _subCategoryProvider = useProvider(subCategoryProvider);
    _subCategoryProvider.getByCaterogyId(categoryId: categoryId);
    final subCategories = _subCategoryProvider.subCategories;

    return Scaffold(
        appBar: AppBar(
          title: Text("SUB CATEGORY PAGE(問題一覧)"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...subCategories.map<Widget>((subCategory) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(QuestionPage.routeName,
                          arguments: subCategory.id);
                    },
                    child: Card(
                      child: (Text('${subCategory.title}')),
                    ),
                  );
                })
              ]),
        ));
  }
}
