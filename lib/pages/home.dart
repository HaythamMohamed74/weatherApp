
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// WeatherModel ?weatherData;
void updateUi(){
  setState(() {

  });

}
WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App') ,
        actions:[ IconButton(onPressed: () {
          Navigator.push(context ,
          MaterialPageRoute(
              builder:  (BuildContext context) =>  Search(upUi: updateUi,),
          )
          );
        }, icon: const Icon(Icons.search),),
    ]
      ),
      body:   Provider.of<WeatherProvider>(context).weatherData == null? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('There is no Weather ❌',style: TextStyle(
              fontSize: 25
            ),),
            Text('Searching Now 🔎',style: TextStyle(
                fontSize: 25
            ),),

          ],
        ),
      ):Center(

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3,),
              Text( Provider.of<WeatherProvider>(context).cityName!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text( 'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(fontSize: 24),),

                ],
              )
              ,SizedBox(height: 70,)
              ,Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(weatherData!.getImage())
                  // ,SizedBox(width: 50,)
                  ,Text( weatherData!.temp.toInt().toString(),style: TextStyle(fontSize: 17),)
                   // ,SizedBox(width: 50,)
                  ,Column(children: [
                    Text('Mix:${weatherData!.maxTemp.toInt()} ',style: TextStyle(fontSize: 10),),
                    Text('Min: ${weatherData!.minTemp.toInt()}',style: TextStyle(fontSize: 10),),
                  ],)
                ],
              )
              ,SizedBox(height: 50,)
              ,Text(weatherData!.state,style: TextStyle(fontSize: 30),)
             ,
              Spacer(flex: 5,)
            ],
          ),
        ),
      ),

    );
  }
}
