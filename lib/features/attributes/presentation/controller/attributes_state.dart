import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/domain/entities/terms.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

class AttributesState extends Equatable {
  //
  final List<Term> allStores;
  final List<Term> searchedStores;
  //
  final List<Term> allRestaurants;
  final List<Term> searchedRestaurants;
  //attribute terms
  final List<Term> brandsTerms;
  final List<Term> searchedBrandsTerms;
  final RequestState brandsTermsState;
  final String brandsTermsMessage;
//
  final List<Term> clothingTerms;
  final RequestState clothingTermsState;
  final String clothingTermsMessage;
  //
  final List<Term> shoesandbagsTerms;
  final RequestState shoesandbagsTermsState;
  final String shoesandbagsTermsMessage;
  //
  final List<Term> electronicequipmentTerms;
  final RequestState electronicequipmentTermsState;
  final String electronicequipmentTermsMessage;
//
  final List<Term> houseandkitchenTerms;
  final RequestState houseandkitchenTermsState;
  final String houseandkitchenTermsMessage;
  //
  final List<Term> makeupTerms;
  final RequestState makeupTermsState;
  final String makeupTermsMessage;
  //
  final List<Term> watchesandaccessoriesTerms;
  final RequestState watchesandaccessoriesTermsState;
  final String watchesandaccessoriesTermsMessage;
  //
  final List<Term> perfumesTerms;
  final RequestState perfumesTermsState;
  final String perfumesTermsMessage;
  //
  final List<Term> handmadeTerms;
  final RequestState handmadeTermsState;
  final String handmadeTermsMessage;
  //
  final List<Term> petsTerms;
  final RequestState petsTermsState;
  final String petsTermsMessage;
  //
  final List<Term> toysTerms;
  final RequestState toysTermsState;
  final String toysTermsMessage;
  //
  final List<Term> massTerms;
  final RequestState massTermsState;
  final String massTermsMessage;
  //
  final List<Term> libraryTerms;
  final RequestState libraryTermsState;
  final String libraryTermsMessage;
  //
  final List<Term> fastfoodTerms;
  final RequestState fastfoodTermsState;
  final String fastfoodTermsMessage;
  //
  final List<Term> arabfoodTerms;
  final RequestState arabfoodTermsState;
  final String arabfoodTermsMessage;
  //
  final List<Term> sweetTerms;
  final RequestState sweetTermsState;
  final String sweetTermsMessage;
  //
  final List<Term> coffeeTerms;
  final RequestState coffeeTermsState;
  final String coffeeTermsMessage;

  final List<Term> bannersTerms;
  final RequestState bannersTermsState;
  final String bannersTermsMessage;

  //
  final List<Product> termProducts;
  final RequestState loadMore;
  final RequestState termProductsState;
  final String termProductsMessage;

  final int currentSlider;

  // 2
  const AttributesState(
      {
      //
      this.allStores = const [],
      this.searchedStores = const [],
      //
      this.allRestaurants = const [],
      this.searchedRestaurants = const [],
      //attribute terms

      this.brandsTerms = const [],
      this.searchedBrandsTerms = const [],
      this.brandsTermsState = RequestState.loading,
      this.brandsTermsMessage = '',
      //
      this.clothingTerms = const [],
      this.clothingTermsState = RequestState.loading,
      this.clothingTermsMessage = '',
      //
      this.shoesandbagsTerms = const [],
      this.shoesandbagsTermsState = RequestState.loading,
      this.shoesandbagsTermsMessage = '',
      //
      this.electronicequipmentTerms = const [],
      this.electronicequipmentTermsState = RequestState.loading,
      this.electronicequipmentTermsMessage = '',
      //
      this.houseandkitchenTerms = const [],
      this.houseandkitchenTermsState = RequestState.loading,
      this.houseandkitchenTermsMessage = '',
      //
      this.makeupTerms = const [],
      this.makeupTermsState = RequestState.loading,
      this.makeupTermsMessage = '',
      //
      this.watchesandaccessoriesTerms = const [],
      this.watchesandaccessoriesTermsState = RequestState.loading,
      this.watchesandaccessoriesTermsMessage = '',
      //
      this.perfumesTerms = const [],
      this.perfumesTermsState = RequestState.loading,
      this.perfumesTermsMessage = '',
      //
      this.handmadeTerms = const [],
      this.handmadeTermsState = RequestState.loading,
      this.handmadeTermsMessage = '',
      //
      this.petsTerms = const [],
      this.petsTermsState = RequestState.loading,
      this.petsTermsMessage = '',
      //
      this.toysTerms = const [],
      this.toysTermsState = RequestState.loading,
      this.toysTermsMessage = '',
      //
      this.libraryTerms = const [],
      this.libraryTermsState = RequestState.loading,
      this.libraryTermsMessage = '',
      //
      this.massTerms = const [],
      this.massTermsState = RequestState.loading,
      this.massTermsMessage = '',
      //
      this.fastfoodTerms = const [],
      this.fastfoodTermsState = RequestState.loading,
      this.fastfoodTermsMessage = '',
      //
      this.arabfoodTerms = const [],
      this.arabfoodTermsState = RequestState.loading,
      this.arabfoodTermsMessage = '',
      //
      this.sweetTerms = const [],
      this.sweetTermsState = RequestState.loading,
      this.sweetTermsMessage = '',
      //
      this.coffeeTerms = const [],
      this.coffeeTermsState = RequestState.loading,
      this.coffeeTermsMessage = '',
      //
      this.bannersTerms = const [],
      this.bannersTermsState = RequestState.loading,
      this.bannersTermsMessage = '',
      //
      this.termProducts = const [],
      this.loadMore = RequestState.loaded,
      this.termProductsState = RequestState.loading,
      this.termProductsMessage = '',
      //
      this.currentSlider = 0});

  get allCategories => null;

  AttributesState copyWith(
      {
      //
      List<Term>? allStores,
      List<Term>? searchedStores,
      //
      List<Term>? allRestaurants,
      List<Term>? searchedRestaurants,
      // attribute terms

      final List<Term>? brandsTerms,
      final List<Term>? searchedBrandsTerms,
      final RequestState? brandsTermsState,
      final String? brandsTermsMessage,
      //
      final List<Term>? clothingTerms,
      final RequestState? clothingTermsState,
      final String? clothingTermsMessage,
      //
      final List<Term>? shoesandbagsTerms,
      final RequestState? shoesandbagsTermsState,
      final String? shoesandbagsTermsMessage,
      //
      final List<Term>? electronicequipmentTerms,
      final RequestState? electronicequipmentTermsState,
      final String? electronicequipmentTermsMessage,
      //
      final List<Term>? houseandkitchenTerms,
      final RequestState? houseandkitchenTermsState,
      final String? houseandkitchenTermsMessage,
      //
      final List<Term>? makeupTerms,
      final RequestState? makeupTermsState,
      final String? makeupTermsMessage,
      //
      final List<Term>? watchesandaccessoriesTerms,
      final RequestState? watchesandaccessoriesTermsState,
      final String? watchesandaccessoriesTermsMessage,
      //
      final List<Term>? perfumesTerms,
      final RequestState? perfumesTermsState,
      final String? perfumesTermsMessage,
      //
      final List<Term>? handmadeTerms,
      final RequestState? handmadeTermsState,
      final String? handmadeTermsMessage,
      //
      final List<Term>? petsTerms,
      final RequestState? petsTermsState,
      final String? petsTermsMessage,
      //
      final List<Term>? toysTerms,
      final RequestState? toysTermsState,
      final String? toysTermsMessage,
      //
      final List<Term>? libraryTerms,
      final RequestState? libraryTermsState,
      final String? libraryTermsMessage,
      //
      final List<Term>? massTerms,
      final RequestState? massTermsState,
      final String? massTermsMessage,
      //
      final List<Term>? fastfoodTerms,
      final RequestState? fastfoodTermsState,
      final String? fastfoodTermsMessage,
      //
      final List<Term>? arabfoodTerms,
      final RequestState? arabfoodTermsState,
      final String? arabfoodTermsMessage,
      //
      final List<Term>? sweetTerms,
      final RequestState? sweetTermsState,
      final String? sweetTermsMessage,
      //
      final List<Term>? coffeeTerms,
      final RequestState? coffeeTermsState,
      final String? coffeeTermsMessage,
      //
      final List<Term>? bannersTerms,
      final RequestState? bannersTermsState,
      final String? bannersTermsMessage,
      //
      final List<Product>? termProducts,
      final RequestState? loadMore,
      final RequestState? termProductsState,
      final String? termProductsMessage,
      //
      final int? currentSlider}) {
    return AttributesState(
        //
        allStores: allStores ?? this.allStores,
        searchedStores: searchedStores ?? this.searchedStores,
        //
        allRestaurants: allRestaurants ?? this.allRestaurants,
        searchedRestaurants: searchedRestaurants ?? this.searchedRestaurants,
        //
        brandsTerms: brandsTerms ?? this.brandsTerms,
        searchedBrandsTerms: searchedBrandsTerms ?? this.searchedBrandsTerms,
        brandsTermsState: brandsTermsState ?? this.brandsTermsState,
        brandsTermsMessage: brandsTermsMessage ?? this.brandsTermsMessage,
        //
        clothingTerms: clothingTerms ?? this.clothingTerms,
        clothingTermsState: clothingTermsState ?? this.clothingTermsState,
        clothingTermsMessage: clothingTermsMessage ?? this.clothingTermsMessage,
        //
        shoesandbagsTerms: shoesandbagsTerms ?? this.shoesandbagsTerms,
        shoesandbagsTermsState:
            shoesandbagsTermsState ?? this.shoesandbagsTermsState,
        shoesandbagsTermsMessage:
            shoesandbagsTermsMessage ?? this.shoesandbagsTermsMessage,
        //
        electronicequipmentTerms:
            electronicequipmentTerms ?? this.electronicequipmentTerms,
        electronicequipmentTermsState:
            electronicequipmentTermsState ?? this.electronicequipmentTermsState,
        electronicequipmentTermsMessage: electronicequipmentTermsMessage ??
            this.electronicequipmentTermsMessage,
        //
        houseandkitchenTerms: houseandkitchenTerms ?? this.houseandkitchenTerms,
        houseandkitchenTermsState:
            houseandkitchenTermsState ?? this.houseandkitchenTermsState,
        houseandkitchenTermsMessage:
            houseandkitchenTermsMessage ?? this.houseandkitchenTermsMessage,
        //
        makeupTerms: makeupTerms ?? this.makeupTerms,
        makeupTermsState: makeupTermsState ?? this.makeupTermsState,
        makeupTermsMessage: makeupTermsMessage ?? this.makeupTermsMessage,
        //
        watchesandaccessoriesTerms:
            watchesandaccessoriesTerms ?? this.watchesandaccessoriesTerms,
        watchesandaccessoriesTermsState: watchesandaccessoriesTermsState ??
            this.watchesandaccessoriesTermsState,
        watchesandaccessoriesTermsMessage: watchesandaccessoriesTermsMessage ??
            this.watchesandaccessoriesTermsMessage,
        //
        perfumesTerms: perfumesTerms ?? this.perfumesTerms,
        perfumesTermsState: perfumesTermsState ?? this.perfumesTermsState,
        perfumesTermsMessage: perfumesTermsMessage ?? this.perfumesTermsMessage,
        //
        handmadeTerms: handmadeTerms ?? this.handmadeTerms,
        handmadeTermsState: handmadeTermsState ?? this.handmadeTermsState,
        handmadeTermsMessage: handmadeTermsMessage ?? this.handmadeTermsMessage,
        //
        petsTerms: petsTerms ?? this.petsTerms,
        petsTermsState: petsTermsState ?? this.petsTermsState,
        petsTermsMessage: petsTermsMessage ?? this.petsTermsMessage,
        //
        toysTerms: toysTerms ?? this.toysTerms,
        toysTermsState: toysTermsState ?? this.toysTermsState,
        toysTermsMessage: toysTermsMessage ?? this.toysTermsMessage,
        //
        libraryTerms: libraryTerms ?? this.libraryTerms,
        libraryTermsState: libraryTermsState ?? this.libraryTermsState,
        libraryTermsMessage: libraryTermsMessage ?? this.libraryTermsMessage,
        //
        massTerms: massTerms ?? this.massTerms,
        massTermsState: massTermsState ?? this.massTermsState,
        massTermsMessage: massTermsMessage ?? this.massTermsMessage,
        //
        fastfoodTerms: fastfoodTerms ?? this.fastfoodTerms,
        fastfoodTermsState: fastfoodTermsState ?? this.fastfoodTermsState,
        fastfoodTermsMessage: fastfoodTermsMessage ?? this.fastfoodTermsMessage,
        //
        arabfoodTerms: arabfoodTerms ?? this.arabfoodTerms,
        arabfoodTermsState: arabfoodTermsState ?? this.arabfoodTermsState,
        arabfoodTermsMessage: arabfoodTermsMessage ?? this.arabfoodTermsMessage,
        //
        sweetTerms: sweetTerms ?? this.sweetTerms,
        sweetTermsState: sweetTermsState ?? this.sweetTermsState,
        sweetTermsMessage: sweetTermsMessage ?? this.sweetTermsMessage,
        //
        coffeeTerms: coffeeTerms ?? this.coffeeTerms,
        coffeeTermsState: coffeeTermsState ?? this.coffeeTermsState,
        coffeeTermsMessage: coffeeTermsMessage ?? this.coffeeTermsMessage,

        //
        bannersTerms: bannersTerms ?? this.bannersTerms,
        bannersTermsState: bannersTermsState ?? this.bannersTermsState,
        bannersTermsMessage: bannersTermsMessage ?? this.bannersTermsMessage,

        //
        termProducts: termProducts ?? this.termProducts,
        termProductsState: termProductsState ?? this.termProductsState,
        loadMore: loadMore ?? this.loadMore,
        termProductsMessage: termProductsMessage ?? this.termProductsMessage,
        //
        currentSlider: currentSlider ?? this.currentSlider);
  }

  @override
  List<Object?> get props =>
      //5
      [
        //
        allStores,
        searchedStores,
        //
        allRestaurants,
        searchedRestaurants,
        //attribute terms
        brandsTerms,
        searchedBrandsTerms,
        brandsTermsMessage,
        brandsTermsState,
        //
        clothingTerms,
        clothingTermsMessage,
        clothingTermsState,
        //
        shoesandbagsTerms,
        shoesandbagsTermsMessage,
        shoesandbagsTermsState,
        //
        electronicequipmentTerms,
        electronicequipmentTermsMessage,
        electronicequipmentTermsState,
        //
        houseandkitchenTerms,
        houseandkitchenTermsMessage,
        houseandkitchenTermsState,
        //
        makeupTerms,
        makeupTermsMessage,
        makeupTermsState,
        //
        watchesandaccessoriesTerms,
        watchesandaccessoriesTermsMessage,
        watchesandaccessoriesTermsState,
        //
        perfumesTerms,
        perfumesTermsMessage,
        perfumesTermsState,
        //
        handmadeTerms,
        handmadeTermsMessage,
        handmadeTermsState,
        //
        petsTerms,
        petsTermsMessage,
        petsTermsState,
        //
        toysTerms,
        toysTermsMessage,
        toysTermsState,
        //
        libraryTerms,
        libraryTermsMessage,
        libraryTermsState,
        //
        massTerms,
        massTermsMessage,
        massTermsState,
        //
        fastfoodTerms,
        fastfoodTermsMessage,
        fastfoodTermsState,
        //
        arabfoodTerms,
        arabfoodTermsMessage,
        arabfoodTermsState,
        //
        sweetTerms,
        sweetTermsMessage,
        sweetTermsState,
        //
        coffeeTerms,
        coffeeTermsMessage,
        coffeeTermsState,

        //
        bannersTerms,
        bannersTermsMessage,
        bannersTermsState,
        //
        termProducts,
        termProductsMessage,
        termProductsState,
        loadMore,

        currentSlider
      ];
}
