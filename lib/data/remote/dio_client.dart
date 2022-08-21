import 'package:dio/dio.dart';
import 'package:flutter_weather_06072022/common/app_constant.dart';

class DioClient {
  static final DioClient _dioClient = DioClient._internal();
  static Dio? _dio;

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal() {
    if (_dio == null) {
      var options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: 30000,
        sendTimeout: 30000,
        receiveTimeout: 30000,
      );
      _dio = Dio(options);
      _dio?.interceptors.add(LogInterceptor());
    }
  }

  Dio get dio => _dio ?? Dio();
}