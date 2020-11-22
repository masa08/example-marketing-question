import 'package:get_it/get_it.dart';
import 'package:marketing_questions/domain/model/category/repository.dart';

class CategoryNotifier {
  final CategoryRepository _categoryRepository =
      GetIt.instance<CategoryRepository>();

  bool get() {
    final categories = _categoryRepository.get();
    print(categories);
    return true;
  }
}
