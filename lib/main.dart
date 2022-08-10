import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/common/app_constant.dart';
import 'package:flutter_weather_06072022/data/remote/dio_client.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppConstant.routeHomePage: (context) => HomePage()
      },
      initialRoute: AppConstant.routeHomePage
    );
  }
}