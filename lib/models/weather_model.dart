import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  final String weatherStateName;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String cityName;
  final DateTime createdTime;

  WeatherModel(
      {@required this.createdTime,
      @required this.weatherStateName,
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

  Color getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orangeAccent;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blueAccent;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blueAccent;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.deepPurpleAccent;
    } else {
      return Colors.orangeAccent;
    }
  }

  MaterialColor gettMaterialColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.yellow;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.deepPurple;
    } else {
      return Colors.yellow;
    }
  }
}
