import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';

class HomeController extends ChangeNotifier {
  late ClimateRepository _climateRepository;

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  void getTempFromCityName({String cityName = ""}) async{
    try {
      var response = await _climateRepository.getTempFromCityName(cityName: cityName);
      print(response.toString());
    }catch(e) {
      print(e.toString());
    }
  }
}