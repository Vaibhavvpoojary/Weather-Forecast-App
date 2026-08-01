import 'package:flutter/material.dart';

import '../../services/weather_service.dart';

import '../../models/weather_model.dart';
import '../../models/forecast_model.dart';
import '../../widgets/weather_tip.dart';
import '../../widgets/current_weather_card.dart';
import '../../widgets/weather_details_card.dart';
import '../../widgets/hourly_forecast.dart';
import '../../services/location_search_service.dart';

import '../../widgets/search_city.dart';


class HomeScreen extends StatefulWidget {


  final String city;
  final double latitude;
  final double longitude;
  final String userName;


  const HomeScreen({

    super.key,

    required this.city,
    required this.latitude,
    required this.longitude,
    required this.userName,

  });



  @override
  State<HomeScreen> createState() => _HomeScreenState();

}




class _HomeScreenState extends State<HomeScreen> {


  late double latitude;
  late double longitude;
  late String city;



  @override
  void initState(){

    super.initState();


    latitude = widget.latitude;

    longitude = widget.longitude;

    city = widget.city;

  }




  void searchNewCity(String value) async {


    try{


      final location =
      await LocationSearchService()
          .searchCity(value);



      setState(() {


        latitude =
        location["latitude"]!;


        longitude =
        location["longitude"]!;


        city = value;


      });


    }


    catch(e){


      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(

          content: Text(
            e.toString(),
          ),

        ),

      );


    }


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text("Mausam+"),

        centerTitle: true,

      ),




      body: FutureBuilder<WeatherModel>(


        future: WeatherService()
            .getCurrentWeather(

          latitude: latitude,

          longitude: longitude,

        ),



        builder:(context,snapshot){



          if(snapshot.connectionState ==
              ConnectionState.waiting){

            return const Center(

              child:CircularProgressIndicator(),

            );

          }




          if(snapshot.hasError){

            return Center(

              child:Text(

                snapshot.error.toString(),

              ),

            );

          }




          final weather = snapshot.data!;




          return SingleChildScrollView(


            padding:
            const EdgeInsets.all(20),



            child: Column(


              crossAxisAlignment:
              CrossAxisAlignment.start,



              children:[



                Text(

                  "👋 Good Morning, ${widget.userName}",

                  style:const TextStyle(

                    fontSize:22,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                const SizedBox(height:5),




                Text(

                  "📍 ${weather.city}",

                  style:const TextStyle(

                    fontSize:16,

                  ),

                ),




                const SizedBox(height:25),





                Center(

                  child:CurrentWeatherCard(

                    weather:weather,

                  ),

                ),





                const SizedBox(height:20),





                WeatherDetailsCard(

                  weather:weather,

                ),




                const SizedBox(height:30),




                // SEARCH CITY HERE

                SearchCity(

                  onSearch: searchNewCity,

                ),




                const SizedBox(height:30),


                WeatherTipCard(

                  weather: weather,

                ),


                const SizedBox(height:30),



                FutureBuilder<List<ForecastModel>>(


                  future: WeatherService()
                      .getHourlyForecast(

                    latitude: latitude,

                    longitude: longitude,

                  ),



                  builder:(context,snapshot){



                    if(snapshot.connectionState ==
                        ConnectionState.waiting){

                      return const Center(

                        child:
                        CircularProgressIndicator(),

                      );

                    }



                    if(snapshot.hasError){

                      return Text(

                        snapshot.error.toString(),

                      );

                    }


                    return HourlyForecast(

                      forecast:
                      snapshot.data!,

                    );



                  },

                ),



              ],

            ),

          );


        },

      ),


    );

  }

}