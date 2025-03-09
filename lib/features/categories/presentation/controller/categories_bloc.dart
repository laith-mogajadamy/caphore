import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_categories_by_parent_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_last_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_search_products_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:collection/collection.dart";

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetProductDetailsUseCase getProductDetailsUseCase;
  GetCategoryProductsUseCase getCategoryProductsUseCase;
  GetLastProductsUseCase getLastProductsUseCase;
  GetSearchProductsUseCase getSearchProductsUseCase;
  GetCategoriesByParentUseCase getCategoriesByParentUseCase;

  CategoriesBloc(
      this.getAllCategoriesUseCase,
      this.getProductDetailsUseCase,
      this.getCategoryProductsUseCase,
      this.getLastProductsUseCase,
      this.getSearchProductsUseCase,
      this.getCategoriesByParentUseCase)
      : super(const CategoriesState()) {
    //All Category Event
    on<GetAllCategoriesEvent>((event, emit) async {
      final result =
          await getAllCategoriesUseCase(const AllCategoriesParameters(page: 1));
      final result2 =
          await getAllCategoriesUseCase(const AllCategoriesParameters(page: 2));

      await result.fold(
        (l) async {
          emit(state.copyWith(
              allCategoriesMessage: l.message,
              allCategoriesState: RequestState.error));
        },
        (r) async {
          List<Category> a = [];

          // Function to fetch children
          Future<List<Category>> fetchChildren(int parentId) async {
            print('fetchChildren');
            final childrenResult = await getCategoriesByParentUseCase(
                CategoriesByParentParameters(parent: parentId));

            return childrenResult.fold(
              (l) => [], // Return empty list on error
              (r) {
                print('childrenResult=======');
                print(r);
                r.sort((a, b) => a.description.compareTo(b.description));
                return r;
              },
            );
          }

          // Process both pages in one function
          Future<void> processCategories(List<Category> categories) async {
            for (var e in categories) {
              if (e.parent == 0 && e.image.src != '') {
                var children = await fetchChildren(e.id);
                e = e.copyWith(children: children);
                a.add(e);
                print('categorie==========');
                print(e);
              }
            }
          }

          // Fetch first page categories
          await processCategories(r);

          // Fetch second page categories
          await result2.fold(
            (l) async {},
            (r2) async {
              await processCategories(r2);
            },
          );

          // Sort final category list
          a.sort((a, b) => a.description.compareTo(b.description));

          emit(state.copyWith(
            allCategories: a,
            allCategoriesState: RequestState.loaded,
            categoryParents: r.groupListsBy((element) => element.parent),
          ));
        },
      );
    });

    //get categories by parent
    on<GetCategoriesByParentEvent>((event, emit) async {
      final result = await getCategoriesByParentUseCase(
          CategoriesByParentParameters(parent: event.parent));
      result.fold(
          (l) => emit(state.copyWith(
              categoriesByParentMessage: l.message,
              categoriesByParentState: RequestState.error)), (r) {
        for (var a in r) {
          print(a.description + a.name);
        }
        r.sort((a, b) => a.description.compareTo(b.description));
        emit(state.copyWith(
            categoriesByParentState: RequestState.loaded,
            categoriesByParent: r));
      });
    });

    //get categories by child
    on<GetCategoriesByChildEvent>((event, emit) async {
      final result = await getCategoriesByParentUseCase(
          CategoriesByParentParameters(parent: event.parent));
      result.fold(
          (l) => emit(state.copyWith(
              categoriesByChildMessage: l.message,
              categoriesByChildState: RequestState.error)), (r) {
        emit(state.copyWith(
            categoriesByChildState: RequestState.loaded, categoriesByChild: r));
      });
    });

    //Product Details Event
    on<GetProductDetailsEvent>((event, emit) async {});

    //category Products event
    on<GetCategoryProductsEvent>((event, emit) async {
      emit(state.copyWith(loadMore: RequestState.loading));

      final result = await getCategoryProductsUseCase(
        CategoryProductsParameters(
          categoryId: event.categoryId,
          page: event.pageNum,
          perPage: event.perPage,
        ),
      );
      result.fold(
        (failure) {
          emit(state.copyWith(
            categoryProductsMessage: failure.message,
            categoryProductsState: RequestState.error,
            loadMore: RequestState.error,
          ));
        },
        (newProducts) {
          List<Product> updatedProducts = List.from(event.lastProducts)
            ..addAll(newProducts);

          emit(state.copyWith(
            categoryProducts: updatedProducts,
            categoryProductsState: RequestState.loaded,
          ));

          emit(state.copyWith(
            loadMore:
                newProducts.isEmpty ? RequestState.error : RequestState.loaded,
          ));
        },
      );
      print("state.categoryProducts.length");
      print(state.categoryProducts.length);
    });

    //last Products Event
    on<GetLastProductsEvent>((event, emit) async {
      final result = await getLastProductsUseCase(CategoryProductsParameters(
          categoryId: 0, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              lastProductsMessage: l.message,
              lastProductsState: RequestState.error,
              categoryProductsMessage: l.message,
              categoryProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              lastProducts:
                  r.skipWhile((value) => value.name == 'AUTO-DRAFT').toList(),
              lastProductsState: RequestState.loaded,
              categoryProducts:
                  r.skipWhile((value) => value.name == 'AUTO-DRAFT').toList(),
              categoryProductsState: RequestState.loaded)));
    });

    //search products event
    on<GetSearchProductsEvent>((event, emit) async {
      if (event.search != '') {
        emit(state.copyWith(searchProductsState: RequestState.loading));
        final result = await getSearchProductsUseCase(SearchProductsParameters(
            search: event.search, page: event.pageNum, perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                searchProductsMessage: l.message,
                searchProductsState: RequestState.error)),
            (r) => emit(state.copyWith(
                searchProducts: r, searchProductsState: RequestState.loaded)));
      } else {
        emit(state.copyWith(
            searchProducts: [], searchProductsState: RequestState.loaded));
      }
    });

    //
    on<CurrentSliderEvent>((event, emit) {
      emit(state.copyWith(currentSlider: event.currentSlider));
    });
    on<ChangeSearchIconEvent>((event, emit) {
      emit(state.copyWith(
          searchProducts: [],
          searchicon: event.searchicon,
          searchProductsState: RequestState.loading));
    });
  }
}
