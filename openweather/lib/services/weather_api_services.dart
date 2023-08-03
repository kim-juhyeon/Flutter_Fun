import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:openweather/constants/constants.dart';
import 'package:openweather/exceptions/weather_exception.dart';
import 'package:openweather/models/direct_geocoding.dart';
import 'package:openweather/models/weather.dart';
import 'package:openweather/services/http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;
  WeatherApiServices({
    required this.httpClient,
  });

  Future<DirectGeocoding> getDirectGeopcoidng(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kApiHost,
        path: '/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': kLimit,
          'appid': dotenv.env['APPID'],
        });
    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);

      if (responseBody.isEmpty) {
        throw WeatherException('cannot get the location $city');
      }
      final directGeocoding = DirectGeocoding.fromJson(responseBody);
      return directGeocoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(DirectGeocoding directGeocoding) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: '/data/2.5/weather',
      queryParameters: {
        'lat': '${directGeocoding.lat}',
        'lon': '${directGeocoding.lon}',
        'unit': kUnit,
        'appid': dotenv.env['APPID'],
      },
    );
    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
