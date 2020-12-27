import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:marketing_questions/domain/model/sub_category/repository.dart';
import 'package:marketing_questions/domain/model/sub_category/sub_category.dart';

final subCategoryProvider =
    ChangeNotifierProvider((ref) => SubCategoryProvider());

class SubCategoryProvider with ChangeNotifier {
  final SubCategoryRepository _subCategoryRepository =
      GetIt.instance<SubCategoryRepository>();

  List<SubCategory> _subCategories = [];

  List<SubCategory> get subCategories => _subCategories;

  Future<void> getByCaterogyId({String categoryId}) {
    _subCategoryRepository
        .getByCategoryId(categoryId: categoryId)
        .then((question) {
      _subCategories = question;
      notifyListeners();
    });
  }
}
