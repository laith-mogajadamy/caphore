import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/pages/brands.dart';
import 'package:caphore/features/goldenMall/goldenmall.dart';
import 'package:caphore/features/pages/restaurants.dart';
import 'package:caphore/features/pages/stores.dart';
import 'package:caphore/features/pages/controlpanel.dart';
import 'package:caphore/features/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 2;
  late PageController controller;
  bool hasnet = true;
  var categoryBloc = sl<CategoriesBloc>();
  var attributesBloc = sl<AttributesBloc>();

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  categoryBloc..add(const GetAllCategoriesEvent(page: 1))),
          BlocProvider(
            create: (context) => attributesBloc
              ..add(
                const GetBrandTermsEvent(
                    pageNum: 1, perPage: 100, attributeId: 7, isRefresh: false),
              ),
          ),
        ],
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              if (select != 2) {
                controller.jumpToPage(2);
                setState(() {
                  select = 2;
                });
                return false;
              } else {
                SystemNavigator.pop();
                return true;
              }
            },
            child: Scaffold(
              body: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Brands(),
                  Stores(),
                  const Home(),
                  const Restaurants(),
                  const ControlPanel(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/diamond-svgrepo-com.svg',
                      color: AppColor.accentColor,
                      height: 25.h,
                      width: 20.w,
                    ),
                    label: "الماركات",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/store-svgrepo-com.svg",
                      color: AppColor.accentColor,
                      height: 25.h,
                      width: 20.w,
                    ),
                    label: "المتاجر",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/home_icon.svg',
                      color: AppColor.accentColor,
                      height: 25.h,
                      width: 20.w,
                    ),
                    label: "الرئيسية",
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/images/restaurant-plate-svgrepo-com.svg",
                      color: AppColor.accentColor,
                      height: 25.h,
                      width: 20.w,
                    ),
                    label: "المطاعم",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/information-button.png',
                      height: 30.h,
                      width: 25.w,
                    ),
                    label: "معلوماتنا",
                  ),
                ],
                currentIndex: select,
                onTap: (index) {
                  setState(() {
                    select = index;
                  });
                  controller.jumpToPage(select);
                },
                selectedItemColor: AppColor.accentColor,
                selectedFontSize: 16.sp,
                selectedIconTheme:
                    IconThemeData(size: 30.r, color: AppColor.accentColor),
                showUnselectedLabels: true,
                unselectedIconTheme:
                    IconThemeData(size: 30.r, color: AppColor.accentColor),
                unselectedItemColor: AppColor.accentColor,
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
