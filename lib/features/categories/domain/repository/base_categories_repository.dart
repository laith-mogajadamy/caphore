import 'package:caphore/features/categories/data/models/products_model.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_search_products_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:caphore/core/error/failure.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';


abstract class BaseCategoriesRepository {
  Future<Either<Failure, List<ProductModel>>> getCategoryProducts(CategoryProductsParameters parameters);

  Future<Either<Failure, Product>> getProductDetails(ProductDetailsParameters parameters);

  Future<Either<Failure, List<Category>>> getAllCategories(int page);
  
  Future<Either<Failure, List<Category>>> getCategoriesByParent(int parent);

  Future<Either<Failure, List<Product>>> getLastProducts(CategoryProductsParameters parameters);

  Future<Either<Failure, List<Product>>> getSearchProducts(SearchProductsParameters parameters);



}
