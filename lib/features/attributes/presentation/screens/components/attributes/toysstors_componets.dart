import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class ToysStorsComponent extends StatelessWidget {
  const ToysStorsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        return Column(
          children: [
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.toysTerms.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreProducts(
                          attribute: 'kids-toys',
                          termid: state.toysTerms[index].id,
                          event: GetTermProductsEvent(
                              attribute: 'kids-toys',
                              termId: state.toysTerms[index].id,
                              perPage: 20,
                              pageNum: 1),
                          storeName: state.toysTerms[index].name,
                          image:
                              (state.toysTerms[index].description.split(';')[2])
                                      .isEmpty
                                  ? ''
                                  : (state.toysTerms[index].description
                                      .split(';')[2]),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 120.h,
                    child: CategoryCard(
                      name: state.toysTerms[index].name,
                      image: (state.toysTerms[index].description.split(';')[1])
                              .isEmpty
                          ? ''
                          : (state.toysTerms[index].description.split(';')[1]),
                    ),
                  ),
                );
              },
            ),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: state.libraryTerms.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreProducts(
                          attribute: 'stationery',
                          termid: state.libraryTerms[index].id,
                          event: GetTermProductsEvent(
                              attribute: 'stationery',
                              termId: state.libraryTerms[index].id,
                              perPage: 26,
                              pageNum: 1),
                          storeName: state.libraryTerms[index].name,
                          image: (state.libraryTerms[index].description
                                      .split(';')[2])
                                  .isEmpty
                              ? ''
                              : (state.libraryTerms[index].description
                                  .split(';')[2]),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 120.h,
                    child: CategoryCard(
                      name: state.libraryTerms[index].name,
                      image:
                          (state.libraryTerms[index].description.split(';')[1])
                                  .isEmpty
                              ? ''
                              : (state.libraryTerms[index].description
                                  .split(';')[1]),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
