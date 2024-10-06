part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeather extends WeatherEvent {
  final Position position;

  FetchWeather({required this.position});

  @override
  List<Object?> get props => [position];
}

class FetchSearchWeather extends WeatherEvent {
  final String CityName;

  FetchSearchWeather({required this.CityName});

  @override
  List<Object?> get props => [CityName];
}
