// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:openweather/models/weather.dart';
import 'package:openweather/repositories/weather_api_services.dart';

import '../../models/custom_error.dart';

part 'weather_state.dart'; //weather_state.dart가 povider의 종속되어 있음 명시해줍니다.

class WeatherProvider with ChangeNotifier {
  WeatherState _state = WeatherState.initial();
  WeatherState get state => _state; //외부에서도 access 할 수 있도록 해줍니다.

  final WeatherRepository weatherRepository;
  WeatherProvider({
    required this.weatherRepository,
  });

  Future<void> fetchWeather(String city) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);
      _state = _state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      );
      print('status : $_state');
    } on CustomError catch (e) {
      _state = _state.copyWith(status: WeatherStatus.error, error: e);
    }
  }
}
