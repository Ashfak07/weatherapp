import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatherapp/controller/wheather_controller.dart';
import 'package:weatherapp/view/home_screen/home_screen.dart';
import 'package:weatherapp/view/location_select/location_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Flutter Demo', home: LocationSelect());
  }
}
