import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeController{
  late ClimateRepository _climateRepository;
  BehaviorSubject<Climate> _behaviorClimateController = BehaviorSubject();
  StreamController<bool> _loadingController = StreamController();

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  Stream<Climate> get climateStream => _behaviorClimateController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;

  Sink get climateSink => _behaviorClimateController.sink;
  Sink get loadingSink => _loadingController.sink;

  void getTempFromCityName({String cityName = ""}) async{
    _loadingController.sink.add(true);
    try {
      await Future.delayed(Duration(seconds: 2));
      Response responseDTO = await _climateRepository.getTempFromCityName(cityName: cityName);
      ClimateDto climateDto = ClimateDto.fromJson(responseDTO.data);
      _behaviorClimateController.sink.add(climateDto.convertToClimate());
    } on DioError catch(dioError) {
      print(dioError.message);
      // _appResource = AppResource.error(dioError.message);
    } catch(e) {
      print(e.toString());
    }
    _loadingController.sink.add(false);
  }
}
