import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/services/services_locator.dart';

class Fullproductimage extends StatelessWidget {
  final List<String> imeges;

  const Fullproductimage({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = sl<CategoriesBloc>();
    Size size = MediaQuery.of(context).size;
    final PageController pageController = PageController();

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.whiteColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: imeges.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        imeges[index],
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
                          count: imeges.length,
                          effect: ExpandingDotsEffect(
                            dotColor: AppColor.accentColor,
                            activeDotColor: AppColor.darkOrangeColor,
                            dotHeight: 10.h,
                            dotWidth: 15.w,
                          ),
                        ),
                      ],
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
