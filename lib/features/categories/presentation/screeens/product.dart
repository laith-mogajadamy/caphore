import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/screeens/fullproductimage.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productbotoom.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productimageslider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  final List<Product> products;

  const ProductScreen({
    super.key,
    required this.product,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var nameAndNumber = [];
    String hide_wa_button = "no";
    String viwes = "0";

    int j = 0;
    Size size = MediaQuery.of(context).size;
    while (j <= (product.meta_data.length) - 1) {
      if (product.meta_data[j].key == "_hide_wa_button") {
        hide_wa_button = product.meta_data[j].value;
      }
      if (product.meta_data[j].key == "_wa_order_phone_number") {
        nameAndNumber = product.meta_data[j].value.split(';');
      }
      if (product.meta_data[j].key == "pageview") {
        viwes = product.meta_data[j].value;
      }
      j++;
    }
    if (nameAndNumber.length < 2) {
      nameAndNumber = ['caphore', '963955942519'];
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: AppColor.primaryColor),
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
          title: Text(
            "تفاصيل المنتج",
            style: TextStyle(
                color: AppColor.accentColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: ProductBottom(
          hide_wa_button: hide_wa_button,
          name: product.name,
          link: product.permalink,
          storename: nameAndNumber[0],
          price: product.price,
          orginalPrice: '',
          number: nameAndNumber[1],
          product: product,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Fullproductimage(
                            imeges: product.images.map((e) => e.src).toList(),
                          ),
                        ),
                      );
                    },
                    child: ProductImageSlider(
                      images: product.images.map((e) => e.src).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Divider(
                  color: const Color.fromARGB(255, 95, 95, 95),
                  thickness: 1.h,
                ),
              ),
              (product.shortDescription == '')
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Text(
                        "لا يوجد وصف ",
                        style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                      ),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الوصف:",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: RichText(
                  text: HTML.toTextSpan(context, product.shortDescription),
                  //...
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.bar_chart_sharp,
              //         size: 30.r,
              //       ),
              //       Text(
              //         "    جميع مشاهدات اليوم   ",
              //         style: TextStyle(
              //             fontSize: 18.sp,
              //             color: const Color.fromARGB(255, 84, 78, 78)),
              //       ),
              //       Text(
              //         viwes,
              //         style: TextStyle(fontSize: 20.sp, color: Colors.black),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Text(
                  "قد يعجبك ايضا:",
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: SizedBox(
                  height: size.height / 2.45,
                  width: double.infinity.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (product.id != products[index].id) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                            product: products[index],
                                            products: products,
                                          )));
                            },
                            child: SizedBox(
                              child: ProductCard(
                                productname: products[index].name,
                                price: products[index].price,
                                orginalprice: products[index].regularPrice,
                                image: products[index].images.isNotEmpty
                                    ? products[index].images[0].src
                                    : '',
                              ),
                            ));
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  (product.images.length == 1)
//                   ? Image.network(
//                       product.images[0].src,
//                       fit: BoxFit.fill,
//                       height: 300.h,
//                     )
//                   : ImageSliderWithIndex(
//                       imeges: product.images.map((e) => e.src).toList()),
