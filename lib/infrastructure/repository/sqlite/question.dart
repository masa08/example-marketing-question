import 'package:marketing_questions/domain/model/question/question.dart';
import 'package:marketing_questions/domain/model/question/repository.dart';
import 'package:marketing_questions/infrastructure/sqlite/query.dart';

class QuestionSqfliteRepository extends QuestionRepository {
  QuestionSqfliteRepository(SqfliteQuery query) : _query = query;

  final SqfliteQuery _query;

  @override
  Future<List<Question>> getByCategoryId({String categoryId}) async {
    final questions = await _query
        .select('SELECT * FROM question WHERE category_id = $categoryId');
    return questions.map((question) => _mapToCategory(question)).toList();
  }

  Question _mapToCategory(
    Map<String, String> question,
  ) {
    return Question(
      id: question['id'],
      categoryId: question['category_id'],
      subCategoryId: question['sub_category_id'],
      title: question['title'],
      explanation: question['explanation'],
    );
  }
}
