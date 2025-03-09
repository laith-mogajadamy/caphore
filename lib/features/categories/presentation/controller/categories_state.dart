import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  // 1

  //
  final Map<Object, List<Category>> categoryParents;
  final List<Category> allCategories;
  final RequestState allCategoriesState;
  final String allCategoriesMessage;

  //
  final List<Category> categoriesByParent;
  final RequestState categoriesByParentState;
  final String categoriesByParentMessage;

  final List<Category> categoriesByChild;
  final RequestState categoriesByChildState;
  final String categoriesByChildMessage;

  //
  final Product product;
  final RequestState productState;
  final String productMessage;

  //
  final List<Product> lastProducts;
  final RequestState lastProductsState;
  final String lastProductsMessage;

  //
  final List<Product> categoryProducts;
  final RequestState categoryProductsState;
  final RequestState loadMore;
  final String categoryProductsMessage;

  //
  final List<Product> searchProducts;
  final RequestState searchProductsState;
  final String searchProductsMessage;

  //
  final int currentSlider;
  final bool searchicon;
  //
  final bool hasChildern;

  // 2
  const CategoriesState({
    this.categoryParents = const {},
    this.allCategories = const [],
    this.allCategoriesState = RequestState.loading,
    this.allCategoriesMessage = '',
    //
    this.categoriesByParent = const [],
    this.categoriesByParentState = RequestState.loading,
    this.categoriesByParentMessage = '',

    //
    this.categoriesByChild = const [],
    this.categoriesByChildState = RequestState.loading,
    this.categoriesByChildMessage = '',

    //
    this.product = const Product(
        id: 0,
        name: '',
        permalink: '',
        salePrice: '',
        description: '',
        shortDescription: '',
        price: '',
        regularPrice: '',
        categories: [],
        images: [],
        meta_data: [],
        nameAndNumber: '',
        nameAndNumber2: '',
        amount: 1,
        total: 0),
    this.productState = RequestState.loading,
    this.productMessage = '',
    //
    this.lastProducts = const [],
    this.lastProductsState = RequestState.loading,
    this.lastProductsMessage = '',
    //
    this.categoryProducts = const [],
    this.categoryProductsState = RequestState.loading,
    this.loadMore = RequestState.loaded,
    this.categoryProductsMessage = '',
    //search
    this.searchProducts = const [],
    this.searchProductsState = RequestState.loaded,
    this.searchProductsMessage = '',

    //

    this.currentSlider = 0,
    this.searchicon = false,
    //
    this.hasChildern = false,
  });

  CategoriesState copyWith({
    //3
    final Map<Object, List<Category>>? categoryParents,
    final List<Category>? allCategories,
    final RequestState? allCategoriesState,
    final String? allCategoriesMessage,

    //
    final List<Category>? categoriesByParent,
    final RequestState? categoriesByParentState,
    final String? categoriesByParentMessage,

    //
    final List<Category>? categoriesByChild,
    final RequestState? categoriesByChildState,
    final String? categoriesByChildMessage,

    //
    final Product? product,
    final RequestState? productState,
    final String? productMessage,

    //
    final List<Product>? lastProducts,
    final RequestState? lastProductsState,
    final String? lastProductsMessage,
    //

    final List<Product>? categoryProducts,
    final RequestState? categoryProductsState,
    final RequestState? loadMore,
    final String? categoryProductsMessage,

    //
    final List<Product>? searchProducts,
    final RequestState? searchProductsState,
    final String? searchProductsMessage,

    //
    final int? currentSlider,
    final bool? searchicon,
    //
    final bool? hasChildern,
  }) {
    return CategoriesState(
      // 4
      categoryParents: categoryParents ?? this.categoryParents,
      allCategories: allCategories ?? this.allCategories,
      allCategoriesState: allCategoriesState ?? this.allCategoriesState,
      allCategoriesMessage: allCategoriesMessage ?? this.allCategoriesMessage,

      //
      categoriesByParent: categoriesByParent ?? this.categoriesByParent,
      categoriesByParentState:
          categoriesByParentState ?? this.categoriesByParentState,
      categoriesByParentMessage:
          categoriesByParentMessage ?? this.categoriesByParentMessage,

      //
      categoriesByChild: categoriesByChild ?? this.categoriesByChild,
      categoriesByChildState:
          categoriesByChildState ?? this.categoriesByChildState,
      categoriesByChildMessage:
          categoriesByChildMessage ?? this.categoriesByChildMessage,

      //
      product: product ?? this.product,
      productState: productState ?? this.productState,
      productMessage: productMessage ?? this.productMessage,

      //
      lastProducts: lastProducts ?? this.lastProducts,
      lastProductsState: lastProductsState ?? this.lastProductsState,
      lastProductsMessage: lastProductsMessage ?? this.lastProductsMessage,
      //

      categoryProducts: categoryProducts ?? this.categoryProducts,
      categoryProductsState:
          categoryProductsState ?? this.categoryProductsState,
      loadMore: loadMore ?? this.loadMore,
      categoryProductsMessage:
          categoryProductsMessage ?? this.categoryProductsMessage,
      //
      searchProducts: searchProducts ?? this.searchProducts,
      searchProductsState: searchProductsState ?? this.searchProductsState,
      searchProductsMessage:
          searchProductsMessage ?? this.searchProductsMessage,

      //

      currentSlider: currentSlider ?? this.currentSlider,
      searchicon: searchicon ?? this.searchicon,
      //
      hasChildern: hasChildern ?? this.hasChildern,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      //5
      [
        allCategories,
        allCategoriesMessage,
        allCategoriesState,

        //
        categoriesByParent,
        categoriesByParentState,
        categoriesByParentMessage,

        //
        categoriesByChild,
        categoriesByChildState,
        categoriesByChildMessage,

        //
        product,
        productMessage,
        productState,

        //
        lastProductsState,
        lastProductsMessage,
        lastProducts,
        //
        categoryProducts,
        categoryProductsMessage,
        categoryProductsState,
        loadMore,

        //
        searchProducts,
        searchProductsMessage,
        searchProductsState,

        //

        currentSlider,
        searchicon,
        //
        hasChildern,
      ];
}
