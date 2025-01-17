part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final Weather weather;

  WeatherSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}

final class WeatherError extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSearchSuccess extends WeatherState {
  final Weather weather;

  WeatherSearchSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}

final class WeatherSearchError extends WeatherState {}

final class WeatherSearchLoading extends WeatherState {}
