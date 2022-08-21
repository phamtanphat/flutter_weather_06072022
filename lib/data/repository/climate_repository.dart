import 'package:flutter/widgets.dart';
import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';

class ClimateRepository{
  late ApiService _apiService;

  void updateClimateRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future getTempFromCityName({String cityName = ""}) {
    return _apiService.getTempFromCityName(cityName: cityName);
  }
}