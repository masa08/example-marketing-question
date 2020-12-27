import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/domain/model/category/category.dart';
import 'package:marketing_questions/domain/model/category/repository.dart';

final categoryProvider = ChangeNotifierProvider((ref) => CategoryNotifier());

class CategoryNotifier with ChangeNotifier {
  final CategoryRepository _categoryRepository =
      GetIt.instance<CategoryRepository>();

  List<Category> _theoryCategories = [];
  List<Category> _practiceCategories = [];

  List<Category> get theoryCatories => _theoryCategories;
  List<Category> get practiceCategories => _practiceCategories;

  Future<void> getTheoryCategories() {
    _categoryRepository.getByTheory().then((category) {
      _theoryCategories = category;
      notifyListeners();
    });
  }

  Future<void> getPracticalCategories() {
    _categoryRepository.getByPractical().then((category) {
      _practiceCategories = category;
      notifyListeners();
    });
  }
}
