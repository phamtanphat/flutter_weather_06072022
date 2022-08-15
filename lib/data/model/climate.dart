import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';

class Climate {
  List<Weather> weather = [];
  Main main = Main();
  int dt = -1;
  Sys sys = Sys();
  String name = "";

  Climate();

  Climate.init({
    required this.weather,
    required this.main,
    required this.dt,
    required this.sys,
    required this.name
  });

  @override
  String toString() {
    return 'Climate{weather: $weather, main: $main, dt: $dt, sys: $sys, name: $name}';
  }
}

class Sys {
  String country = "";
  Sys({this.country = ""});

  @override
  String toString() {
    return 'Sys{country: $country}';
  }
}

class Main {
  int temp = -1;
  int tempMin = -1;
  int tempMax = -1;

  Main({ this.temp = -1, this.tempMin = -1, this.tempMax = -1});

  @override
  String toString() {
    return 'Main{temp: $temp, tempMin: $tempMin, tempMax: $tempMax}';
  }
}

class Weather {
  String main = "";
  String description = "";

  Weather({ this.main = "", this.description = ""});

  @override
  String toString() {
    return 'Weather{main: $main, description: $description}';
  }
}
