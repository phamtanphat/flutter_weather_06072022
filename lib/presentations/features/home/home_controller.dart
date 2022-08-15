import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';

class HomeController extends ChangeNotifier {
  late ClimateRepository _climateRepository;
  String data = "";

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  void getTempFromCityName({String cityName = ""}) async{
    try {

      var response = await _climateRepository.getTempFromCityName(cityName: cityName);
      data = Random().nextInt(100).toString();
      notifyListeners();

    }catch(e) {
      print(e.toString());
    }
  }
}