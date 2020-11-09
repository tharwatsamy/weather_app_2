import 'package:weather_app/models/weather_model.dart';

class WeatherData {
  WeatherModel _weatherModel;

  set setWeatherData(WeatherModel weatherModel) {
    this._weatherModel = weatherModel;
  }

  WeatherModel get getWeatherData => this._weatherModel;
}
