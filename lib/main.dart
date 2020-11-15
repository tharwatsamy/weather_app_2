import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/providers/weather_provder.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/screens/search_page.dart';

main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeDataProvider()),
    ChangeNotifierProvider(create: (context) => WeatherData()),
  ], child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeDataProvider>(context).getThemeData,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        SearchPage.id: (context) => SearchPage(),
      },
    );
  }
}
