import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherAPi {
  String _baseUrl = 'https://www.metaweather.com/';
  Future<int> fetchId(String cityName) async {
    var response =
        await http.get('$_baseUrl/api/location/search/?query=$cityName');
    var name = '';

    try {
      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body);
        var jsonMap = jsonList[0];
        int id = jsonMap['woeid'];
        return id;
      } else {
        //do something else
      }
    } catch (ex) {
      // do something
    }
  }

  Future<WeatherModel> fetchWeather(String cityName) async {
    int id = await fetchId(cityName);
    print('this is the id $id');
    var response = await http.get('$_baseUrl/api/location/$id/');

    if (response.statusCode == 200) {
      var dataMap = jsonDecode(response.body);
      var weatherMap = dataMap['consolidated_weather'][0];

      WeatherModel weatherModel = WeatherModel(
          createdTime: DateTime.now(),
          weatherStateName: weatherMap['weather_state_name'],
          minTemp: weatherMap['min_temp'],
          maxTemp: weatherMap['max_temp'],
          temp: weatherMap['the_temp'],
          cityName: dataMap['title']);
      return weatherModel;
    } else {
      throw Exception('Error in  status code ');
    }
  }
}
