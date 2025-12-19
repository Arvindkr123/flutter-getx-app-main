import 'package:flutter_getx/views/content_page.dart';
import 'package:flutter_getx/views/my_detail_page.dart';
import 'package:flutter_getx/views/my_home_page.dart';
import 'package:get/route_manager.dart';

class RouteNames {
  static const String initial = "/";
  static const String homePage = "/home-page";
  static const String contentPage = "/content";
  static const String detailPage = "/detail_page";

  static String getInitial() => initial;
  static String getHomePage() => homePage;
  static String getContentPage() => contentPage;
  static String getDetailPage() => detailPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MyHomePage()),
    GetPage(name: contentPage, page: () => ContentPage()),
    GetPage(name: detailPage, page: () => DetailPage())
  ];
}
