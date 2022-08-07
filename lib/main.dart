import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/utils/gesture.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.LOGIN,
      // AppPages.INITIAL,
      getPages: AppPages.routes,
      scrollBehavior: MyCustomScrollBehavior(),
    ),
  );
}
