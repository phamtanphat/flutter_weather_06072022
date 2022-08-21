import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_event.dart';
import 'package:rxdart/rxdart.dart';

class HomeController{
  late ClimateRepository _climateRepository;
  BehaviorSubject<Climate> _behaviorClimateController = BehaviorSubject();
  StreamController<bool> _loadingController = StreamController();
  StreamController<HomeBaseEvent> _eventController = StreamController();

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  HomeController() {
    _eventController.stream.listen((event) {
      switch(event.runtimeType) {
        case CallDefaultWeatherEvent:
          _getTempFromCityName(event as CallDefaultWeatherEvent);
          break;
      }
    });
  }

  Stream<Climate> get climateStream => _behaviorClimateController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;

  Sink get climateSink => _behaviorClimateController.sink;
  Sink get loadingSink => _loadingController.sink;
  Sink get eventSink => _eventController.sink;

  void _getTempFromCityName(CallDefaultWeatherEvent event) async{
    _loadingController.sink.add(true);
    try {
      Response responseDTO = await _climateRepository.getTempFromCityName(cityName: event.cityName);
      ClimateDto climateDto = ClimateDto.fromJson(responseDTO.data);
      _behaviorClimateController.sink.add(climateDto.convertToClimate());
    } on DioError catch(dioError) {
      var messageError = dioError.response?.data["message"] ?? dioError.message;
      _behaviorClimateController.sink.addError(messageError);
    } catch(e) {
      _behaviorClimateController.sink.addError(e);
    }
    _loadingController.sink.add(false);
  }
}
