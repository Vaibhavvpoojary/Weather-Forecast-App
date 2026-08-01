import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';



class LocationSearchService {


  Future<Map<String,double>> searchCity(String city) async {


    final url = Uri.parse(

      "https://api.openweathermap.org/geo/1.0/direct"
      "?q=$city"
      "&limit=1"
      "&appid=${AppConstants.apiKey}"

    );



    final response = await http.get(url);



    if(response.statusCode == 200){


      final data = jsonDecode(response.body);



      if(data.isEmpty){

        throw Exception("City not found");

      }



      return {


        "latitude":
        (data[0]["lat"] as num).toDouble(),



        "longitude":
        (data[0]["lon"] as num).toDouble(),


      };


    }

    else{


      throw Exception(
        "Failed to search city",
      );


    }


  }


}