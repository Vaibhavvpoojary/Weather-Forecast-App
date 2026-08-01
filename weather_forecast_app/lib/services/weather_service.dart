import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../models/forecast_model.dart';
import '../utils/constants.dart';

class WeatherService {


  Future<WeatherModel> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {

    final url = Uri.parse(
      "${AppConstants.baseUrl}/weather"
      "?lat=$latitude"
      "&lon=$longitude"
      "&appid=${AppConstants.apiKey}"
      "&units=metric",
    );


    final response = await http.get(url);


    if(response.statusCode == 200){

      final data = jsonDecode(response.body);

      return WeatherModel.fromJson(data);

    } 
    else {

      throw Exception("Failed to load weather");

    }

  } // END current weather



  // ADD FORECAST METHOD HERE 👇

  Future<List<ForecastModel>> getHourlyForecast({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      "${AppConstants.baseUrl}/forecast"
      "?lat=$latitude"
      "&lon=$longitude"
      "&appid=${AppConstants.apiKey}"
      "&units=metric",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List list = data["list"];

      // Convert to ForecastModel list
      List<ForecastModel> allForecasts = list
          .map((item) => ForecastModel.fromJson(item))
          .toList();

      // Filter to show only times from 8 AM to 11 PM
      List<ForecastModel> filteredForecasts = allForecasts.where((forecast) {
        DateTime time = DateTime.parse(forecast.time);
        int hour = time.hour;
        return hour >= 8 && hour <= 23; // 8 AM to 11 PM
      }).toList();

      // Return up to 8 items (or fewer if not enough in the time range)
      return filteredForecasts.take(8).toList();
    } else {
      throw Exception("Failed to load forecast");
    }
  } // END forecast method

} // WeatherService class ends here
