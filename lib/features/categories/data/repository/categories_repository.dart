import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/error/failure.dart';
import 'package:caphore/features/categories/data/datasource/categories_remote_data_source.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_search_products_usecase.dart';
import 'package:dartz/dartz.dart';

import '../models/products_model.dart';

class CategoriesRepository extends BaseCategoriesRepository {
  final BaseCategoriesRemoteDataSource baseCategoriesRemoteDataSource;

  CategoriesRepository(this.baseCategoriesRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories(int page) async {
    final result = await baseCategoriesRemoteDataSource.getAllCategories(page);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoriesByParent(
      int parent) async {
    final result =
        await baseCategoriesRemoteDataSource.getCategoriesByParent(parent);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getCategoryProducts(
      CategoryProductsParameters parameters) async {
    final result = await baseCategoriesRemoteDataSource.getAllCategoryProducts(
        parameters.categoryId, parameters.page, parameters.perPage);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(
      ProductDetailsParameters parameters) async {
    final result = await baseCategoriesRemoteDataSource
        .getProductDetails(parameters.productId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getLastProducts(
      CategoryProductsParameters parameters) async {
    final result = await baseCategoriesRemoteDataSource.getLastProducts(
        parameters.page, parameters.perPage);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getSearchProducts(
      SearchProductsParameters parameters) async {
    final result = await baseCategoriesRemoteDataSource.getSearchProducts(
        parameters.search, parameters.page, parameters.perPage);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
