import 'dart:async';

import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MallBannersComponent extends StatefulWidget {
  const MallBannersComponent({
    super.key,
  });

  @override
  State<MallBannersComponent> createState() => _MallBannersComponentState();
}

class _MallBannersComponentState extends State<MallBannersComponent> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(const GetBannersTermsEvent(
            pageNum: 1, attributeId: 34, perPage: 100)),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          List<String> localimages = [];
          List<String> attributeName = [];
          List<String> termId = [];

          if (state.bannersTerms.isNotEmpty) {
            List<String> banners = state.bannersTerms[2].description.split(';');
            for (int i = 0; i < banners.length; i++) {
              localimages.add(banners[i]);
            }
          }
          images = localimages;
          return SizedBox(
            height: size.height / 3.5,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                images[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColor.accentColor,
                    activeDotColor: AppColor.darkOrangeColor,
                    dotHeight: 10.h,
                    dotWidth: 15.w,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
