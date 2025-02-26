import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSearchField extends StatelessWidget {
  const BrandsSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return SizedBox(
      height: 65.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Form(
          child: TextFormField(
            cursorColor: Colors.white,
            onChanged: (value) {
              context
                  .read<AttributesBloc>()
                  .add(SearchBrands(text: controller.text));
            },
            onEditingComplete: () {
              context
                  .read<AttributesBloc>()
                  .add(SearchBrands(text: controller.text));
            },
            controller: controller,
            enabled: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.accentColor, width: 2.w),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'ابحث ضمن الماركات',
              hintStyle: const TextStyle(color: AppColor.accentColor),
              filled: true,
              fillColor: AppColor.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  if (controller.text.isEmpty) {
                  } else {
                    context
                        .read<AttributesBloc>()
                        .add(SearchBrands(text: controller.text));
                  }
                },
                icon: (controller.text.isEmpty)
                    ? Icon(
                        Icons.search,
                        size: 25.sp,
                        color: AppColor.accentColor,
                      )
                    : Icon(
                        Icons.check,
                        size: 25.sp,
                        color: AppColor.accentColor,
                      ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.accentColor),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Form(
      //   child: TextFormField(
      //     onTap: () {
      //       Navigator.of(context).pushNamed("/Search");
      //     },
      //     enabled: false,
      //     decoration: InputDecoration(
      //       filled: true,
      //       fillColor: AppColor.primaryColor,
      //       suffixIcon: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 5.w),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Text(
      //               "البحث عن منتجات...  ",
      //               style: TextStyle(
      //                   color: AppColor.accentColor,
      //                   fontSize: 16.sp,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //             Icon(
      //               Icons.search,
      //               size: 28.sp,
      //               color: AppColor.accentColor,
      //             ),
      //           ],
      //         ),
      //       ),
      //       prefixIcon: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 6.w),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.of(context).pushNamed("/pages");
      //           },
      //           child: SizedBox(
      //             height: 50.h,
      //             width: 120.w,
      //             child: Image.asset(
      //               "assets/images/89.png",
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //         ),
      //       ),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),