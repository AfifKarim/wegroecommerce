import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.dataSource,
  });

  final CategoryDataSource dataSource;

  @override
  Future<Either<Exception, List<String>>> categories() async {
    try {
      final response = await dataSource.categories();

      return Right(categoryModelFromJson(response.data));
    } catch (e, stacktrace) {
      log(
        'CategoryRepositoryImpl.categories',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(e as Exception);
    }
  }
}
