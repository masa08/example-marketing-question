import 'package:marketing_questions/domain/model/question/question.dart';
import 'package:marketing_questions/domain/model/sub_category/repository.dart';
import 'package:marketing_questions/domain/model/sub_category/sub_category.dart';
import 'package:marketing_questions/infrastructure/sqlite/query.dart';

class SubCategorySqfliteRepository extends SubCategoryRepository {
  SubCategorySqfliteRepository(SqfliteQuery query) : _query = query;

  final SqfliteQuery _query;

  @override
  Future<List<SubCategory>> getByCategoryId({String categoryId}) async {
    final subCategories = await _query
        .select('SELECT * FROM sub_category WHERE category_id = $categoryId');
    return subCategories
        .map((subCategory) => _mapToCategory(subCategory))
        .toList();
  }

  SubCategory _mapToCategory(
    Map<String, String> subCategory,
  ) {
    return SubCategory(
      id: subCategory['id'],
      categoryId: subCategory['category_id'],
      title: subCategory['title'],
    );
  }
}
