import 'package:flutter/material.dart';
import '../models/weather_model.dart';


class WeatherTipCard extends StatelessWidget {


  final WeatherModel weather;


  const WeatherTipCard({

    super.key,

    required this.weather,

  });



  String getTip(){


    String condition =
    weather.condition.toLowerCase();



    if(condition.contains("rain")){

      return "Carry an umbrella today ☔";

    }


    else if(condition.contains("clear")){

      return "Perfect weather for outdoor activities ☀️";

    }


    else if(condition.contains("cloud")){

      return "Cloudy skies today. Keep a jacket nearby ☁️";

    }


    else if(condition.contains("storm")){

      return "Stay indoors, stormy weather expected ⛈️";

    }


    else if(condition.contains("wind")){

      return "It is windy today. Be careful outside 🌬";

    }


    else{

      return "Have a great day! Enjoy the weather 🌈";

    }


  }




  @override
  Widget build(BuildContext context) {


    return Container(


      width: double.infinity,


      padding: const EdgeInsets.all(18),



      decoration: BoxDecoration(


        borderRadius:
        BorderRadius.circular(25),


        color: Colors.amber.shade100,


      ),



      child: Column(


        crossAxisAlignment:
        CrossAxisAlignment.start,



        children: [


          const Text(

            "💡 Weather Tip",

            style: TextStyle(

              fontSize:20,

              fontWeight:FontWeight.bold,

            ),

          ),



          const SizedBox(height:10),



          Text(

            getTip(),

            style: const TextStyle(

              fontSize:16,

            ),

          ),



        ],

      ),

    );


  }


}