import 'package:equatable/equatable.dart';

abstract class HomeBaseEvent extends Equatable{}

class CallDefaultWeatherEvent extends HomeBaseEvent {

  String cityName;

  CallDefaultWeatherEvent({required this.cityName});

  @override
  List<Object?> get props => [];

}