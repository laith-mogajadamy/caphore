import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/storeproducts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

class ImageSliderTwoWithIndex extends StatelessWidget {
  const ImageSliderTwoWithIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(const GetBannersTermsEvent(
            pageNum: 1, attributeId: 34, perPage: 100)),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          List<String> images = [];
          List<String> attributeName = [];
          List<String> termId = [];

          if (state.bannersTerms.isNotEmpty) {
            List<String> banners = state.bannersTerms[1].description.split(';');
            for (int i = 0; i < banners.length; i += 3) {
              images.add(banners[i]);
              attributeName.add(banners[i + 1]);
              termId.add(banners[i + 2]);
            }
          }
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: images.mapIndexed(
                        (ind, item) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoreProducts(
                                event: GetTermProductsEvent(
                                    attribute: attributeName[ind],
                                    termId: int.parse(termId[ind]),
                                    perPage: 100,
                                    pageNum: 1),
                                storeName: 'المطاعم',
                                image: item,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                      },
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      aspectRatio: 2.1.r,
                      viewportFraction: 1,
                      enlargeCenterPage: true),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
