import 'package:marketing_questions/domain/model/category/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> get();
}
