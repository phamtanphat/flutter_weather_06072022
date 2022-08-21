import 'package:dio/dio.dart';
import 'package:flutter_weather_06072022/common/app_constant.dart';
import 'package:flutter_weather_06072022/data/remote/dio_client.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = DioClient().dio;
  }

  Future getTempFromCityName({String cityName = ""}) {
    return _dio.get("data/2.5/weather", queryParameters: {
      "appid": AppConstant.appId,
      "units": "metric",
      "q": cityName
    });
  }
}