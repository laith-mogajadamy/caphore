import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';

class MenClothingComponent extends StatelessWidget {
  const MenClothingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.menClothingProductsState != current.menClothingProductsState,
      builder: (context, state) {
        switch (state.menClothingProductsState) {
          case RequestState.loading:
            return SizedBox(
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/digishi.json',
                  width: 250.w,
                  height: size.height / 2.5,
                  fit: BoxFit.fill,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: SizedBox(
                  height: size.height /2.5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.menClothingProducts.length < 10
                        ? state.menClothingProducts.length
                        : 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product:
                                            state.menClothingProducts[index],
                                        products: state.menClothingProducts,
                                      )));
                        },
                        child: ProductCard(
                          productname: state.menClothingProducts[index].name,
                          price: state.menClothingProducts[index].price,
                          orginalprice:
                              state.menClothingProducts[index].regularPrice,
                          image: state
                                  .menClothingProducts[index].images.isNotEmpty
                              ? state.menClothingProducts[index].images[0].src
                              : '',
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.menClothingProductsMessage),
              ),
            );
        }
      },
    );
  }
}
