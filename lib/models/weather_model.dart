import 'package:flutter/material.dart';

class WeatherModel{
   DateTime date;
   double temp;
   double maxTemp;
   double minTemp;
   String state;

  WeatherModel({required this.date, required this.temp,required this.maxTemp,required this.minTemp,required this.state, });
  factory WeatherModel.fromJson(dynamic data ){
    var jsonData=data['forecast']['forecastday'][0]['day'];
    // print(data['location']['name']);
    // print(jsonData['avgtemp_c']);
    // temp= jsonData['avgtemp_c'];
    // maxTemp=jsonData['maxtemp_c'] ;
    // minTemp=jsonData['mintemp_c'];
    // state=jsonData['condition']['text'];
    // // date= data['location']['name'];
    return WeatherModel( date: DateTime.parse( data['current']['last_updated']), temp: jsonData['avgtemp_c'], maxTemp: jsonData['maxtemp_c'], minTemp: jsonData['mintemp_c'], state: jsonData['condition']['text']);
  }
   String getImage() {
     if (state == 'Sunny' || state == 'Clear' ) {
       return 'assets/images/clear.png';
     } else if (

     state == 'Blizzard' ||  state == 'Patchy snow possible'  ||  state == 'Patchy sleet possible' || state == 'Patchy freezing drizzle possible' || state == 'Blowing snow') {
       return 'assets/images/snow.png';
     } else if (state == 'Freezing fog' || state == 'Fog' ||  state == 'Heavy Cloud' || state == 'Mist' || state
         == 'Fog' ||  state == 'partly cloudy') {
       return 'assets/images/cloudy.png';
     } else if (state == 'Patchy rain possible' ||
         state == 'Heavy Rain' ||
         state == 'Showers	') {
       return 'assets/images/rainy.png';
     } else if (state == 'Thundery outbreaks possible' || state == 'Moderate or heavy snow with thunder' || state == 'Patchy light snow with thunder'|| state == 'Moderate or heavy rain with thunder' || state == 'Patchy light rain with thunder' ) {
       return 'assets/images/thunderstorm.png';
     } else {
       return 'assets/images/clear.png';
     }
   }
   MaterialColor getThemeColor() {
     if (state == 'Sunny' || state == 'Clear' ||  state == 'partly cloudy') {
       return Colors.orange;
     } else if (

     state == 'Blizzard' ||  state == 'Patchy snow possible'  ||  state == 'Patchy sleet possible' || state == 'Patchy freezing drizzle possible' || state == 'Blowing snow') {
       return Colors.blue;
     } else if (state == 'Freezing fog' || state == 'Fog' ||  state == 'Heavy Cloud' || state == 'Mist' || state == 'Fog') {
       return Colors.blueGrey;
     } else if (state == 'Patchy rain possible' ||
         state == 'Heavy Rain' ||
         state == 'Showers	') {
       return Colors.blue;
     } else if (state == 'Thundery outbreaks possible' || state == 'Moderate or heavy snow with thunder' || state == 'Patchy light snow with thunder'|| state == 'Moderate or heavy rain with thunder' || state == 'Patchy light rain with thunder' ) {
       return Colors.deepPurple;
     } else {
       return Colors.orange;
     }
   }
}
