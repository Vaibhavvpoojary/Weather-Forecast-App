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



        // 8 rows × 3 columns grid layout
        GridView.builder(
          
          shrinkWrap: true,
          
          physics: const NeverScrollableScrollPhysics(),
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            
            crossAxisCount: 3, // 3 columns
            
            childAspectRatio: 0.85,
            
            crossAxisSpacing: 10,
            
            mainAxisSpacing: 10,
            
          ),
          
          itemCount: forecast.length,
          
          itemBuilder: (context, index){
          
            final item = forecast[index];
          
            return Container(
          
              padding: const EdgeInsets.all(10),
          
              decoration: BoxDecoration(
          
                borderRadius: BorderRadius.circular(20),
          
                color: Colors.blue.shade50,
          
              ),
          
              child: Column(
          
                mainAxisAlignment: MainAxisAlignment.center,
          
                children: [
          
          
                  Text(
          
                    formatTime(item.time),
          
                    style: const TextStyle(
          
                      fontSize:12,
          
                      fontWeight:FontWeight.w500,
          
                    ),
          
                  ),
          
          
                  Image.network(
          
                    "https://openweathermap.org/img/wn/${item.icon}@2x.png",
          
                    width:40,
          
                  ),
          
          
                  Text(
          
                    "${item.temperature.round()}°",
          
                    style: const TextStyle(
          
                      fontSize:18,
          
                      fontWeight:FontWeight.bold,
          
                    ),
          
                  ),
          
                  // Display rain amount if greater than 0
                  if (item.rain > 0)
                    Text(
                      "💧 ${item.rain.toStringAsFixed(1)}mm",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.blue,
                      ),
                    ),
          
                ],
          
              ),
          
            );
          
          },
          
        ),

      ],

    );

  }

}