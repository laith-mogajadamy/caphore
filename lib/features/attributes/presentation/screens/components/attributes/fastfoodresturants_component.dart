import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class FastFoodResturantsComponent extends StatelessWidget {
  const FastFoodResturantsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.fastfoodTerms.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreProducts(
                      attribute: 'fast-food',
                      termid: state.fastfoodTerms[index].id,
                      event: GetTermProductsEvent(
                          attribute: 'fast-food',
                          termId: state.fastfoodTerms[index].id,
                          perPage: 20,
                          pageNum: 1),
                      storeName: state.fastfoodTerms[index].name,
                      image:
                          (state.fastfoodTerms[index].description.split(';')[2])
                                  .isEmpty
                              ? ''
                              : (state.fastfoodTerms[index].description
                                  .split(';')[2]),
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 120.h,
                child: CategoryCard(
                  name: state.fastfoodTerms[index].name,
                  image: (state.fastfoodTerms[index].description.split(';')[1])
                          .isEmpty
                      ? ''
                      : (state.fastfoodTerms[index].description.split(';')[1]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
