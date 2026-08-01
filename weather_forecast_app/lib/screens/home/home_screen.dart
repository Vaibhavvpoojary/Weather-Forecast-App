import 'package:flutter/material.dart';
import '../../services/weather_service.dart';
import '../../widgets/current_weather_card.dart';
import '../../widgets/weather_details_card.dart';


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


      body: FutureBuilder(

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


const SizedBox(height:30),

              ],
            ),
          );

        },
      ),
    );
  }
}