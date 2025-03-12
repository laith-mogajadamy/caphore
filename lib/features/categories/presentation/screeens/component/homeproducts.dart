import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/brands_component_horizantel.dart';
import 'package:caphore/features/attributes/presentation/screens/components/banners_two_component.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/usecases/get_categories_by_parent_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/categories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/H_CategoryProductsComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/imageSliderWithIndex.dart';
import 'package:caphore/features/goldenMall/goldenmall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:delayed_display/delayed_display.dart';
import '../dynamicshowall.dart';

class Homeproducts extends StatelessWidget {
  const Homeproducts({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = sl<CategoriesBloc>();
    GetCategoriesByParentUseCase t = bloc.getCategoriesByParentUseCase;
    Future<bool> hasChildren(int parentId) async {
      final childrenResult =
          await t(CategoriesByParentParameters(parent: parentId));
      print(childrenResult);
      return childrenResult.fold(
        (l) => false,
        (r) => r.isNotEmpty,
      );
    }

    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.allCategoriesState != current.allCategoriesState,
      builder: (context, state) {
        switch (state.allCategoriesState) {
          case RequestState.loading:
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/waiting.json',
                  fit: BoxFit.fill,
                  height: size.height / 2,
                ),
              ),
            );
          case RequestState.loaded:
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (state.allCategories.length < 14)
                    ? state.allCategories.length
                    : 14,
                itemBuilder: (BuildContext context, int index) {
                  return DelayedDisplay(
                    delay: Duration(seconds: 1 + (index)),
                    slidingCurve: Curves.easeInOut,
                    fadeIn: true,
                    fadingDuration: Duration(seconds: 2 + (index)),
                    slidingBeginOffset: Offset(size.width, 0),
                    child: Column(
                      children: [
                        (index == 0)
                            ? const ImageSliderWithIndex()
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        (index == 0)
                            ? const CategoriesComponent()
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        CategoryNameAndShowAll(
                          name: state.allCategories[index].name,
                          showAllCallBack: () async {
                            if (state.allCategories[index].id == 693) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GoldenMall()),
                              );
                            } else {
                              //
                              bool s = await hasChildren(
                                  state.allCategories[index].id);
                              if (!s) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryProducts(
                                      event: GetCategoryProductsEvent(
                                        categoryId:
                                            state.allCategories[index].id,
                                        pageNum: 1,
                                        perPage: 20,
                                        lastProducts: const [], // ✅ Pass current products
                                      ),
                                      categoryName:
                                          state.allCategories[index].name,
                                      categoryId: state.allCategories[index].id,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DynamicShowAll(
                                        event: GetCategoryProductsEvent(
                                            pageNum: 1,
                                            categoryId:
                                                state.allCategories[index].id,
                                            perPage: 20,
                                            lastProducts: const []),
                                        categoryName:
                                            state.allCategories[index].name,
                                        categoryId:
                                            state.allCategories[index].id),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        H_CategoryProductsComponent(
                            event: GetCategoryProductsEvent(
                                pageNum: 1,
                                categoryId: state.allCategories[index].id,
                                perPage: 10,
                                lastProducts: const []),
                            categoryId: state.allCategories[index].id),
                        (index == 5)
                            ? const ImageSliderTwoWithIndex()
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        (state.allCategories.length < 14)
                            ? (index == state.allCategories.length - 1)
                                ? const BrandsComponentHorizontal()
                                : const SizedBox.shrink()
                            : (index == 13)
                                ? const BrandsComponentHorizontal()
                                : const SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.categoryProductsMessage),
              ),
            );
        }
      },
    );
  }
}
