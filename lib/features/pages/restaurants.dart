import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/arabfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/cofferesturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/fastfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/sweetresturants_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../categories/presentation/screeens/widgets/attrebutename.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc..addAllRestaurants(isRefresh: false),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          switch (state.fastfoodTermsState) {
            case RequestState.loading:
              return Column(
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset('assets/lottie/waiting.json',
                          fit: BoxFit.fill, height: 250.h),
                    ),
                  ),
                  const Spacer()
                ],
              );
            case RequestState.loaded:
              return Scaffold(
                  body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                    child: const Maintextform(),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                          child: const AttributeName(name: "الوجبات السريعة"),
                        ),
                        const FastFoodResturantsComponent(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                          child: const AttributeName(name: "المطبخ العربي"),
                        ),
                        const ArabFoodResturantsComponent(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                          child: const AttributeName(name: "الحلويات"),
                        ),
                        const SweetsResturantsComponent(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                          child: const AttributeName(
                              name: "الضيافة والمكسرات والقهوة"),
                        ),
                        const CoffeeResturantsComponent(),
                      ],
                    ),
                  ),
                ],
              ));
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.fastfoodTermsMessage),
                ),
              );
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
