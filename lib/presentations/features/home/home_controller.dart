import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';

class HomeController extends ChangeNotifier {
  late ClimateRepository _climateRepository;
  Climate _climate = Climate();

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  // Climate get climate => _climate;

  void getTempFromCityName({String cityName = ""}) async{
    try {
      Response responseDTO = await _climateRepository.getTempFromCityName(cityName: cityName);
      ClimateDto climateDto = ClimateDto.fromJson(responseDTO.data);
      _climate = climateDto.convertToClimate();
      print(_climate.toString());
    }catch(e) {
      print(e.toString());
    }
  }
}