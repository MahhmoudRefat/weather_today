import 'package:weather_today/models/weather_models.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel ;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState {}