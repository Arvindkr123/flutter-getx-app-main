import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/routes_name.dart';
import 'package:get/get.dart';
import 'views/content_page.dart';
import 'views/my_detail_page.dart';
import 'views/my_home_page.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode, // 👈 Disabled in Release mode
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Learning App',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.getInitial(),
      // home: MyHomePage(),
      getPages: RouteNames.routes,
    );
  }
}
