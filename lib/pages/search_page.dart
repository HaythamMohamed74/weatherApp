import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import '../providers/weather_provider.dart';

class Search extends StatelessWidget {
  // const Search({Key? key}) : super(key: key);
  VoidCallback? upUi;
  Search({this.upUi});
 String ?cityName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orange,
        title: const Text('Search A City '),
        leading: IconButton(
          onPressed: () {
        Navigator.pop(context);

          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
               onChanged: (data)
              {
              cityName = data;
              },
              onFieldSubmitted: (data) async{
                cityName=data;
                WeatherService service=WeatherService();
                  WeatherModel? weather =await service.getWeather(cityName: cityName!);
                  // weatherData=weather;
                Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                Navigator.pop(context);
              },
            decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: ()  async{

              {
                WeatherService service = WeatherService();

                WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                Navigator.pop(context);
              };
            },
            icon:  Icon(Icons.search_outlined,color: Colors.black,),
              ),
              hintText: 'Enter city name',
              labelText: 'Search',
              border:OutlineInputBorder(

                borderRadius:  BorderRadius.circular(10)
  )),),
          )),
    );
  }
}
//GLOBAL VAR
// WeatherModel? weatherData;
