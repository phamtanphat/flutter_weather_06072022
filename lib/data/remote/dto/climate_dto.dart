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
        weather?.add(Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    name = json['name'];
  }

  List<Weather>? weather;
  Main? main;
  int? dt;
  Sys? sys;
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
}

class Sys {
  Sys({this.country});

  Sys.fromJson(dynamic json) {
    country = json['country'];
  }

  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    return map;
  }
}

class Main {
  Main({this.temp, this.tempMin, this.tempMax});

  Main.fromJson(dynamic json) {
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

class Weather {
  Weather({this.main, this.description});

  Weather.fromJson(dynamic json) {
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
