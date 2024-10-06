import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
            "daa45944c6caccbf02fa6504c9270451",
            language: Language.ENGLISH);

        Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherError());
      }
    });
    on<FetchSearchWeather>((event, emit) async {
      emit(WeatherSearchLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
            "daa45944c6caccbf02fa6504c9270451",
            language: Language.ENGLISH);

        Weather weather =
            await weatherFactory.currentWeatherByCityName(event.CityName);
        emit(WeatherSearchSuccess(weather));
      } catch (e) {
        emit(WeatherSearchError());
      }
    });
  }
}
