import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherService{

  String baseUrl='http://api.weatherapi.com/v1';
  String key='34c152568ac042ebb94152808232801';

 Future<WeatherModel> getWeather({required String cityName}) async{
    Uri url=Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&days=1');

  http.Response response=  await http.get(url);
    if (response.statusCode == 400) {
      var data  = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
  Map<String,dynamic> data=jsonDecode(response.body);
  // var jsonData=data['forecast']['forecastday'][0];

  WeatherModel weather=WeatherModel.fromJson(data);
  return weather;

 }
}
// String Data=data['location']['name'];
// // Icon ico=data['current']['icon'];
// print(data);
// print(Data);
// // print(ico);