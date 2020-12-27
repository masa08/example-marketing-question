import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/domain/model/question/question.dart';
import 'package:marketing_questions/domain/model/question/repository.dart';

final questionProvider = ChangeNotifierProvider((ref) => QuestionProvider());

class QuestionProvider with ChangeNotifier {
  final QuestionRepository _questionRepository =
      GetIt.instance<QuestionRepository>();

  List<Question> _questions = [];

  List<Question> get questions => _questions;

  Future<void> getByCaterogyId({String subCategoryId}) {
    _questionRepository
        .getBySubCategoryId(subCategoryId: subCategoryId)
        .then((question) {
      _questions = question;
      notifyListeners();
    });
  }
}
