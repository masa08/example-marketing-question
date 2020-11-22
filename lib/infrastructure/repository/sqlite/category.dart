import 'package:marketing_questions/domain/model/category/repository.dart';
import 'package:marketing_questions/infrastructure/sqlite/query.dart';

class CategorySqfliteRepository extends CategoryRepository {
  CategorySqfliteRepository(SqfliteQuery query) : _query = query;

  final SqfliteQuery _query;

  @override
  Future<bool> get() async {
    final categories = await _query.select('select * from workbook');
    return true;
  }
}
