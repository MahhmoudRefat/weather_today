import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_today/models/weather_models.dart';
import 'package:weather_today/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
 // TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("searc"
            "h City"),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
           // controller: ,
            onSubmitted: (value) async {
              WeatherModel? weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
              log(weatherModel!.cityName);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 15),
              label: Text("search"),
              hintText: "Enter City name ",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
