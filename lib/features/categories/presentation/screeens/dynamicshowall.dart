import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/H_CategoryProductsComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/component/subcategories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DynamicShowAll extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final CategoriesEvent event;

  const DynamicShowAll({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CategoriesBloc>()
        ..add(GetCategoriesByParentEvent(parent: categoryId)),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w),
                    child: const Maintextform(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.categoriesByParent.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == 0) const SubCategoriesComponent(),
                            CategoryNameAndShowAll(
                              name: state.categoriesByParent[index].name,
                              showAllCallBack: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryProducts(
                                      event: GetCategoryProductsEvent(
                                        categoryId:
                                            state.categoriesByParent[index].id,
                                        pageNum: 1,
                                        perPage: 20,
                                        lastProducts: state
                                            .categoryProducts, // ✅ Pass current products
                                      ),
                                      categoryName:
                                          state.categoriesByParent[index].name,
                                      categoryId:
                                          state.categoriesByParent[index].id,
                                    ),
                                  ),
                                );
                              },
                            ),
                            H_CategoryProductsComponent(
                              event: GetCategoryProductsEvent(
                                pageNum: 1,
                                categoryId: state.categoriesByParent[index].id,
                                perPage: 10,
                                lastProducts: state
                                    .categoryProducts, // ✅ Preserve products when loading more
                              ),
                              categoryId: state.categoriesByParent[index].id,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
