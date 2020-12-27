import 'package:marketing_questions/domain/model/question/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getByCategoryId({String categoryId});
}
