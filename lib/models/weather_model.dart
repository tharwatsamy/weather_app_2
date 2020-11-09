import 'package:flutter/foundation.dart';

class WeatherModel {
  final String weatherStateName;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String cityName;

  WeatherModel(
      {@required this.weatherStateName,
      @required this.minTemp,
      @required this.maxTemp,
      @required this.temp,
      @required this.cityName});

  String fetImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'images/thunderstorm.png';
    } else {
      return 'images/clear.png';
    }
  }
}
