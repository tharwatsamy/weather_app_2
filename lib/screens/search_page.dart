import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/providers/weather_provder.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/weather_api.dart';

class SearchPage extends StatefulWidget {
  static String id = 'SearchPage';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSearching = false;

  String cityName;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isSearching,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Search a City',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: (value) {
                cityName = value;
//
              },
              onSubmitted: (value) async {
                cityName = value;

                WeatherModel model = await WeatherAPi().fetchWeather(cityName);
                Provider.of<ThemeDataProvider>(context, listen: false)
                    .setThemeData = model.getThemeColor();
                Provider.of<WeatherData>(context, listen: false)
                    .setWeatherData = model;
                _isSearching = false;
              },
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () async {
                      setState(() {});
                      try {
                        _isSearching = true;
                        WeatherModel model =
                            await WeatherAPi().fetchWeather(cityName);
                        Provider.of<ThemeDataProvider>(context, listen: false)
                            .setThemeData = model.getThemeColor();
                        Provider.of<WeatherData>(context, listen: false)
                            .setWeatherData = model;
                        _isSearching = false;
                        Navigator.pop(context);
                      } catch (ex) {
                        setState(() {});
                        _isSearching = false;
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content: Text('Enter a vaild city name')));
                      }
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
      ),
    );
  }
}
