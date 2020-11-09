import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provder.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/weather_api.dart';

class SearchPage extends StatelessWidget {
  static String id = 'SearchPage';
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              cityName = value;
              WeatherModel model = await WeatherAPi().fetchWeather(cityName);
              Navigator.pop(context);
              Provider.of<WeatherData>(context, listen: false).setWeatherData =
                  model;
            },
            decoration: InputDecoration(
              suffix: IconButton(
                  onPressed: () async {
                    WeatherModel model =
                        await WeatherAPi().fetchWeather(cityName);
                    Provider.of<WeatherData>(context, listen: false)
                        .setWeatherData = model;
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              labelText: 'Search',
              border: OutlineInputBorder(),
              hintText: 'Enter City Name',
            ),
          ),
        ),
      ),
    );
  }
}
