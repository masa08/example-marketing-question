import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/domain/model/category/repository.dart';

final categoryProvider = ChangeNotifierProvider((ref) => CategoryNotifier());

class CategoryNotifier with ChangeNotifier {
  final CategoryRepository _categoryRepository =
      GetIt.instance<CategoryRepository>();

  bool get() {
    final categories = _categoryRepository.get();
    return true;
  }
}
