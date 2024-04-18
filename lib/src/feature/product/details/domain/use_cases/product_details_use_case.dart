import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../root/data/models/product_model.dart';
import '../../../root/domain/repositories/product_repository.dart';

final productDetailsUseCaseProvider = Provider<ProductDetailsUseCase>(
  (ref) {
    final repository = ref.watch(productRepositoryProvider);
    return ProductDetailsUseCase(repository);
  },
);

class ProductDetailsUseCase {
  ProductDetailsUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<Exception, ProductModel>> product(int id) async {
    return await _repository.product(id);
  }
}
