import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubSubCategoriesComponent extends StatelessWidget {
  const SubSubCategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          (previous.categoriesByChildState != current.categoriesByChildState),
      builder: (context, state) {
        return (state.categoriesByChild.isEmpty)
            ? const SizedBox(
                height: 0,
                width: 0,
              )
            : Container(
                color: Colors.white12,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: size.height / 4.5,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categoriesByChild.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          print(state.categoriesByChild[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryProducts(
                                        event: GetCategoryProductsEvent(
                                            pageNum: 1,
                                            categoryId: state
                                                .categoriesByChild[index].id,
                                            perPage: 20,
                                            lastProducts: const []),
                                        categoryName:
                                            state.categoriesByChild[index].name,
                                        categoryId:
                                            state.categoriesByChild[index].id,
                                      )));
                        },
                        child: SalesAvatar(
                            name: state.categoriesByChild[index].name,
                            image: state.categoriesByChild[index].image.src));
                  },
                ),
              );
      },
    );
  }
}
