import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_today/models/weather_models.dart';
import 'package:weather_today/services/weather_service.dart';

import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
