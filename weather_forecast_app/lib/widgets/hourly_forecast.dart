import 'package:flutter/material.dart';
import '../models/forecast_model.dart';


class HourlyForecast extends StatelessWidget {

  final List<ForecastModel> forecast;


  const HourlyForecast({
    super.key,
    required this.forecast,
  });



  String formatTime(String dateTime){

    DateTime time = DateTime.parse(dateTime);

    int hour = time.hour;


    if(hour == 0){
      return "12 AM";
    }

    if(hour < 12){
      return "$hour AM";
    }

    if(hour == 12){
      return "12 PM";
    }

    return "${hour - 12} PM";

  }



  @override
  Widget build(BuildContext context) {


    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,


      children: [


        const Text(

          "📈 Hourly Forecast",

          style: TextStyle(

            fontSize:20,

            fontWeight:FontWeight.bold,

          ),

        ),


        const SizedBox(height:15),



        SizedBox(

          height:130,


          child: ListView.builder(

            scrollDirection: Axis.horizontal,


            itemCount: forecast.length,


            itemBuilder:(context,index){


              final item = forecast[index];


              return Container(

                width:90,

                margin: const EdgeInsets.only(right:12),


                padding: const EdgeInsets.all(12),


                decoration: BoxDecoration(

                  borderRadius:
                  BorderRadius.circular(20),

                  color: Colors.blue.shade50,

                ),


                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children: [


                    Text(

                      formatTime(item.time),

                      style:
                      const TextStyle(
                        fontSize:14,
                      ),

                    ),


                    Image.network(

                      "https://openweathermap.org/img/wn/${item.icon}@2x.png",

                      width:45,

                    ),



                    Text(

                      "${item.temperature.round()}°",

                      style:
                      const TextStyle(

                        fontWeight:
                        FontWeight.bold,

                        fontSize:18,

                      ),

                    ),

                  ],

                ),

              );

            },

          ),

        )

      ],

    );

  }

}