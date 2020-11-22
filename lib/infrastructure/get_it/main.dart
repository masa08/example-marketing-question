import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:marketing_questions/domain/model/category/repository.dart';
import 'package:marketing_questions/infrastructure/repository/sqlite/category.dart';
import 'package:marketing_questions/infrastructure/sqlite/query.dart';

Future<bool> registerDIContainers() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final getIt = GetIt.instance;
  await registerRepositories(getIt);
  return true;
}

Future<void> registerRepositories(GetIt getIt) async {
  final query = SqfliteQuery();
  query.initialize();

  getIt
    ..registerSingleton(query)
    ..registerLazySingleton<CategoryRepository>(() {
      return CategorySqfliteRepository(GetIt.instance<SqfliteQuery>());
    });
}
