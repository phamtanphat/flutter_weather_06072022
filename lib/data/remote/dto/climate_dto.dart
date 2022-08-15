import 'package:flutter_weather_06072022/data/model/climate.dart';

class ClimateDto {
  ClimateDto({
    this.weather,
    this.main,
    this.dt,
    this.sys,
    this.name,
  });

  ClimateDto.fromJson(dynamic json) {
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(WeatherDto.fromJson(v));
      });
    }
    main = json['main'] != null ? MainDto.fromJson(json['main']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SysDto.fromJson(json['sys']) : null;
    name = json['name'];
  }

  List<WeatherDto>? weather;
  MainDto? main;
  int? dt;
  SysDto? sys;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['name'] = name;
    return map;
  }

  Climate convertToClimate() {
    List<Weather> listWeather = [];
    weather?.forEach((weatherDto) {
      listWeather.add(Weather(main: weatherDto.main ?? "", description: weatherDto.description ?? ""));
    });
    return Climate.init(
        weather: listWeather,
        main: Main(
            temp: main?.temp ?? -1,
            tempMin: main?.tempMin ?? -1,
            tempMax: main?.tempMax ?? -1
        ),
        dt: dt ?? -1,
        sys: Sys(country: sys?.country ?? ""),
        name: name ?? ""
    );
  }
}

class SysDto {
  SysDto({this.country});

  SysDto.fromJson(dynamic json) {
    country = json['country'];
  }

  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    return map;
  }
}

class MainDto {
  MainDto({this.temp, this.tempMin, this.tempMax});

  MainDto.fromJson(dynamic json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }

  int? temp;
  int? tempMin;
  int? tempMax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    return map;
  }
}

class WeatherDto {
  WeatherDto({this.main, this.description});

  WeatherDto.fromJson(dynamic json) {
    main = json['main'];
    description = json['description'];
  }

  String? main;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = main;
    map['description'] = description;
    return map;
  }
}
