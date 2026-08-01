import 'package:flutter/material.dart';
import '../models/weather_model.dart';


class WeatherDetailsCard extends StatelessWidget {

  final WeatherModel weather;


  const WeatherDetailsCard({
    super.key,
    required this.weather,
  });


  Widget detailItem(
      String icon,
      String title,
      String value,
      ) {

    return Column(

      children: [

        Text(
          icon,
          style: const TextStyle(
            fontSize:28,
          ),
        ),


        const SizedBox(height:5),


        Text(
          title,
          style: const TextStyle(
            fontSize:14,
          ),
        ),


        const SizedBox(height:3),


        Text(
          value,
          style: const TextStyle(
            fontSize:16,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }



  @override
  Widget build(BuildContext context) {


    return Container(

      padding: const EdgeInsets.all(20),


      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(25),

        boxShadow: [

          BoxShadow(

            blurRadius:10,

            color: Colors.grey.withOpacity(0.2),

          )

        ],

      ),


      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceAround,


        children: [


          detailItem(
            "💧",
            "Humidity",
            "${weather.humidity}%",
          ),


          detailItem(
            "🌬",
            "Wind",
            "${weather.windSpeed} m/s",
          ),


          detailItem(
            "🌧",
            "Rain",
            "${weather.rain}%",
          ),


          detailItem(
            "🌡",
            "Pressure",
            "${weather.pressure}",
          ),


        ],

      ),

    );

  }
}