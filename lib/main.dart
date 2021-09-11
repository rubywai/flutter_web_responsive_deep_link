import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_view/screen/detail.dart';
import 'package:text_view/screen/home.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/detail/:id', page: () => DetailScreen())
      ],
    );
  }
}