import 'package:flutter/material.dart';
import '../models/weather_model.dart';


class CurrentWeatherCard extends StatelessWidget {

  final WeatherModel weather;


  const CurrentWeatherCard({
    super.key,
    required this.weather,
  });



  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(25),


      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(30),

        gradient: const LinearGradient(

          colors: [

            Colors.blue,

            Colors.lightBlueAccent,

          ],

        ),

      ),


      child: Column(

        children: [


          Image.network(

            "https://openweathermap.org/img/wn/${weather.icon}@2x.png",

            width:100,

          ),



          Text(

            "${weather.temperature.round()}°C",

            style: const TextStyle(

              fontSize:55,

              color:Colors.white,

              fontWeight:FontWeight.bold,

            ),

          ),



          Text(

            "Feels Like ${weather.feelsLike.round()}°C",

            style: const TextStyle(

              color:Colors.white,

              fontSize:18,

            ),

          ),



          const SizedBox(height:10),



          Text(

            weather.condition,

            style: const TextStyle(

              color:Colors.white,

              fontSize:20,

            ),

          ),

        ],

      ),

    );

  }
}