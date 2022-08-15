import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/app_resource.dart';
import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';

class HomeController extends ChangeNotifier {
  late ClimateRepository _climateRepository;
  AppResource<Climate>? _appResource;

  void updateClimateRepository({required ClimateRepository climateRepository}) {
    _climateRepository = climateRepository;
  }

  AppResource<Climate>? get appResourceClimate => _appResource ;

  void getTempFromCityName({String cityName = ""}) async{
    _appResource = AppResource.loading();
    try {
      Response responseDTO = await _climateRepository.getTempFromCityName(cityName: cityName);
      ClimateDto climateDto = ClimateDto.fromJson(responseDTO.data);
      Climate climate = climateDto.convertToClimate();
      _appResource = AppResource.success(climate);
      notifyListeners();
    } on DioError catch(dioError) {
      print(dioError.message);
      // _appResource = AppResource.error(dioError.message);
    } catch(e) {
      print(e.toString());
    }
  }
}