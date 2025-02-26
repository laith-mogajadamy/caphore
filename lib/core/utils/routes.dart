import 'package:caphore/features/pages/stores.dart';
import 'package:caphore/features/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/search/search.dart';
import 'package:caphore/features/welcome/OnBoarding/OBPage.dart';
import 'package:flutter/material.dart';

import '../../features/pages/home.dart';

class MyRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/Home": (context) => Home(),
    "/Search": (context) => const Search(),
    "/Stores": (context) => Stores(),
    "/OBPage": (context) => OBPage(),
    "/pages": (context) => const MyPages()
  };
}
