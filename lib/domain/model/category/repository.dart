import 'package:flutter/foundation.dart';

abstract class CategoryRepository {
  Future<bool> search();
  // Future<List<Category>> search();
}
