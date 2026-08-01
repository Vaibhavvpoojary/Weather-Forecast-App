import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
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

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to load weather");
    }
  }
}