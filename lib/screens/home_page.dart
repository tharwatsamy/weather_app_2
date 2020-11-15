import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provder.dart';
import 'package:weather_app/screens/search_page.dart';
import 'package:weather_app/services/weather_api.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePAge';

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        Provider.of<WeatherData>(context).getWeatherData;
    print('weather model state ${weatherModel?.weatherStateName}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.id);
            },
          )
        ],
      ),
      body: (weatherModel == null)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                    weatherModel.gettMaterialColor()[300],
                    weatherModel.gettMaterialColor()[500],
                    weatherModel.gettMaterialColor()[700],
                  ])),
              padding: EdgeInsets.only(top: 100),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        weatherModel.cityName ?? '',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Text(
                        TimeOfDay.fromDateTime(weatherModel.createdTime)
                            .format(context),
                        style: TextStyle(fontSize: 15, letterSpacing: .7),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          backgroundImage: AssetImage(weatherModel.fetImage())),
                      Text(
                        weatherModel.temp.ceil().toString() ?? '',
                        style: TextStyle(fontSize: 30),
                      ),
                      Column(
                        children: [
                          Text('max: ${weatherModel.maxTemp.ceil()}'),
                          Text('min: ${weatherModel.minTemp.ceil()}'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    weatherModel.weatherStateName ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
    );
  }
}
