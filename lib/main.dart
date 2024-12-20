import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_today/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_today/views/home_view.dart';
import 'package:weather_today/cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      .weatherCondition,
                ),
              ),
              home: HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String weatherCondition) {
  if (weatherCondition == 'Sunny' ||
      weatherCondition == 'Clear' ||
      weatherCondition == 'partly cloudy') {
    return Colors.orange;
  } else if (weatherCondition == 'Blizzard' ||
      weatherCondition == 'Patchy snow possible' ||
      weatherCondition == 'Patchy sleet possible' ||
      weatherCondition == 'Patchy freezing drizzle possible' ||
      weatherCondition == 'Blowing snow') {
    return Colors.blue;
  } else if (weatherCondition == 'Freezing fog' ||
      weatherCondition == 'Fog' ||
      weatherCondition == 'Heavy Cloud' ||
      weatherCondition == 'Mist' ||
      weatherCondition == 'Fog') {
    return Colors.blueGrey;
  } else if (weatherCondition == 'Patchy rain possible' ||
      weatherCondition == 'Heavy Rain' ||
      weatherCondition == 'Showers	') {
    return Colors.blue;
  } else if (weatherCondition == 'Thundery outbreaks possible' ||
      weatherCondition == 'Moderate or heavy snow with thunder' ||
      weatherCondition == 'Patchy light snow with thunder' ||
      weatherCondition == 'Moderate or heavy rain with thunder' ||
      weatherCondition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.orange;
  }
}
