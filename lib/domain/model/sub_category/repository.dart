import 'package:marketing_questions/domain/model/sub_category/sub_category.dart';

abstract class SubCategoryRepository {
  Future<List<SubCategory>> getByCategoryId({String categoryId});
}
