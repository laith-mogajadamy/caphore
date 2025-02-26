import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class BrandsComponent extends StatelessWidget {
  const BrandsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        switch (state.brandsTermsState) {
          case RequestState.loading:
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset('assets/lottie/waiting.json',
                    fit: BoxFit.fill, height: 250.h),
              ),
            );
          case RequestState.loaded:
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.searchedBrandsTerms.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreProducts(
                          attribute: 'brand',
                          termid: state.searchedBrandsTerms[index].id,
                          event: GetTermProductsEvent(
                              attribute: 'brand',
                              termId: state.searchedBrandsTerms[index].id,
                              perPage: 20,
                              pageNum: 1),
                          storeName: state.searchedBrandsTerms[index].name,
                          image: (state.searchedBrandsTerms[index].description
                                      .split(';')[2])
                                  .isEmpty
                              ? ''
                              : (state.searchedBrandsTerms[index].description
                                  .split(';')[2]),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 120.h,
                    child: CategoryCard(
                      name: state.searchedBrandsTerms[index].name,
                      image: (state.searchedBrandsTerms[index].description
                                  .split(';')[1])
                              .isEmpty
                          ? ''
                          : (state.searchedBrandsTerms[index].description
                              .split(';')[1]),
                    ),
                  ),
                );
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.termProductsMessage),
              ),
            );
        }
      },
    );
  }
}
