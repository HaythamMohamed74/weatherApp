import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (BuildContext context) {
  return WeatherProvider();
  },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ?  Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()  ,
        ),
        debugShowCheckedModeBanner: false,
        home: Home()
      // ,routes: {
      //   "home":(context) =>const Home()
      //   ,'search_page':(context) =>const Search()
      // },


      ),
    );
  }
}

