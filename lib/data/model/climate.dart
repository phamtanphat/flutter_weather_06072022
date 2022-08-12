class Climate {
  List<Weather>? weather;
  Main? main;
  int? dt;
  Sys? sys;
  String? name;

  Climate({
    this.weather,
    this.main,
    this.dt,
    this.sys,
    this.name,
  });

  @override
  String toString() {
    return 'Climate{weather: $weather, main: $main, dt: $dt, sys: $sys, name: $name}';
  }
}

class Sys {
  String? country;

  Sys({this.country});

  @override
  String toString() {
    return 'Sys{country: $country}';
  }
}

class Main {
  int? temp;
  int? tempMin;
  int? tempMax;

  Main({this.temp, this.tempMin, this.tempMax});

  @override
  String toString() {
    return 'Main{temp: $temp, tempMin: $tempMin, tempMax: $tempMax}';
  }
}

class Weather {
  String? main;
  String? description;

  Weather({this.main, this.description});

  @override
  String toString() {
    return 'Weather{main: $main, description: $description}';
  }
}
