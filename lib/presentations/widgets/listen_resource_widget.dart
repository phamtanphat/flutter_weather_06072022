import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/data/remote/app_resource.dart';

class ListenResourceWidget extends StatelessWidget {
  Function body;
  AppResource appResource;

  ListenResourceWidget({required this.appResource, required this.body});

  @override
  Widget build(BuildContext context) {
    switch (appResource.runtimeType) {
      case Success:
        return body(appResource.);
      case Loading:
        return const CircularProgressIndicator();
      default:
        return Container();
    }
  }
}