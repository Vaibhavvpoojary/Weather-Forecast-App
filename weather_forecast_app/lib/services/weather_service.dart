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

      // Get current time
      DateTime now = DateTime.now();
      
      // Filter to show only next 24 hours
      List<ForecastModel> next24Hours = allForecasts.where((forecast) {
        DateTime forecastTime = DateTime.parse(forecast.time);
        Duration difference = forecastTime.difference(now);
        return difference.inHours >= 0 && difference.inHours <= 24;
      }).toList();

      // Return forecasts for next 24 hours
      return next24Hours;
    } else {
      throw Exception("Failed to load forecast");
    }
  } // END forecast method

} // WeatherService class ends here
