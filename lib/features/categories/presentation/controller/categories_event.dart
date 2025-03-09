import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesEvent extends CategoriesEvent {
  final int page;

  const GetAllCategoriesEvent({required this.page});
}

class GetCategoriesByParentEvent extends CategoriesEvent {
  final int parent;

  const GetCategoriesByParentEvent({required this.parent});
}

class GetCategoriesByChildEvent extends CategoriesEvent {
  final int parent;

  const GetCategoriesByChildEvent({required this.parent});
}

class GetProductDetailsEvent extends CategoriesEvent {
  final int productId;
  final int categoryId;

  const GetProductDetailsEvent(
      {required this.productId, required this.categoryId});
}

class GetCategoryProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;
  final List<Product> lastProducts;

  const GetCategoryProductsEvent({
    required this.pageNum,
    required this.categoryId,
    required this.perPage,
    required this.lastProducts,
  });
}

class GetLastProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int perPage;

  const GetLastProductsEvent({required this.pageNum, required this.perPage});
}

class GetBrandsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetBrandsProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetSearchProductsEvent extends CategoriesEvent {
  final int pageNum;
  final String search;
  final int perPage;

  const GetSearchProductsEvent(
      {required this.pageNum, required this.search, required this.perPage});
}

class CurrentSliderEvent extends CategoriesEvent {
  final int currentSlider;

  const CurrentSliderEvent({required this.currentSlider});
}

class ChangeSearchIconEvent extends CategoriesEvent {
  final bool searchicon;

  const ChangeSearchIconEvent({
    required this.searchicon,
  });
}
