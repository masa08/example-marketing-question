import 'package:marketing_questions/domain/model/category/category.dart';
import 'package:marketing_questions/domain/model/category/repository.dart';
import 'package:marketing_questions/infrastructure/sqlite/query.dart';

class CategorySqfliteRepository extends CategoryRepository {
  CategorySqfliteRepository(SqfliteQuery query) : _query = query;

  final SqfliteQuery _query;

  @override
  Future<List<Category>> get() async {
    final categories = await _query.select('select * from category');
    return categories
        .map((category) => _mapToCategory(category))
        .toList();
  }

  Category _mapToCategory(
      Map<String, String> category,
      ) {
    return Category(
      id: category['id'],
      chapterId: category['chapter_id'],
      title: category['title'],
    );
  }
}
