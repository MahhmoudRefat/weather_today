
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_today/models/weather_models.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "71dfd8db89d94e958b0113832242911";

  WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]["message"] ??
          "ops there was and error , try later ";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("ops there was an a bad error , try later ");
    }
  }
}
