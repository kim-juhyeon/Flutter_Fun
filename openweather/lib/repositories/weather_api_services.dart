import 'package:openweather/exceptions/weather_exception.dart';
import 'package:openweather/models/custom_error.dart';
import 'package:openweather/models/direct_geocoding.dart';
import 'package:openweather/models/weather.dart';
import 'package:openweather/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });
  //현재 location api 그리고 location 데이터에 있는 위치정보에 맞는 api를 불러오고 있습니다.
  // 그에따라 api 두개를 불러오기 때문에 repository에서 처리하도록 합니다.
  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding directGeocoding =
          await weatherApiServices.getDirectGeopcoidng(city);
      print('dircetGeocoding : $directGeocoding');
      final Weather tempWeather =
          await weatherApiServices.getWeather(directGeocoding);

// weatherapi에 있는 name값이 정확하지 않은 부분이 있어, directGeocodig의 데이터를 이용하고자 directGeocoding 데이터를 copy.with합니다.
      final Weather weather = tempWeather.copyWith(
        name: directGeocoding.name,
        country: directGeocoding.country,
      );
      return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
