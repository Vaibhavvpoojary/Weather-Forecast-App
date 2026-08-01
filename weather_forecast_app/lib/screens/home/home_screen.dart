import 'package:flutter/material.dart';
import '../../services/weather_service.dart';
import '../../models/weather_model.dart';
import '../../models/forecast_model.dart';
import '../../widgets/current_weather_card.dart';
import '../../widgets/weather_details_card.dart';
import '../../widgets/hourly_forecast.dart';


class HomeScreen extends StatelessWidget {

  final String city;
  final double latitude;
  final double longitude;

  const HomeScreen({
    super.key,
    required this.city,
    required this.latitude,
    required this.longitude,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Mausam+"),
        centerTitle: true,
      ),


      body: FutureBuilder<WeatherModel>(

        future: WeatherService().getCurrentWeather(
          latitude: latitude,
          longitude: longitude,
        ),


        builder: (context, snapshot) {


          if(snapshot.connectionState == ConnectionState.waiting){

            return const Center(
              child: CircularProgressIndicator(),
            );

          }


          if(snapshot.hasError){

            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );

          }


          final weather = snapshot.data!;


          return SingleChildScrollView(

            padding: const EdgeInsets.all(20),


            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,


              children: [


                Text(
                  "👋 Good Morning, Vaibhav",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                const SizedBox(height:5),


                Text(
                  "📍 ${weather.city}",
                  style: const TextStyle(
                    fontSize:16,
                  ),
                ),


                const SizedBox(height:25),



                Center(
  child: Column(
    children: [

      CurrentWeatherCard(
        weather: weather,
      ),

    ],
  ),
),


const SizedBox(height:20),


WeatherDetailsCard(
  weather: weather,
),


const SizedBox(height:20),


FutureBuilder<List<ForecastModel>>(
  future: WeatherService().getHourlyForecast(
    latitude: latitude,
    longitude: longitude,
  ),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Text(
          "Error loading forecast: ${snapshot.error}",
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (snapshot.data == null || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    return HourlyForecast(
      forecast: snapshot.data!,
    );
  },
),


const SizedBox(height:30),

              ],
            ),
          );

        },
      ),
    );
  }
}