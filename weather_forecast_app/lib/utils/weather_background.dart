import 'package:flutter/material.dart';

class WeatherBackground {

  static List<Color> getGradient(String condition) {

    condition = condition.toLowerCase();

    if (condition.contains("clear")) {
      return [
        Colors.orange,
        Colors.lightBlueAccent,
      ];
    }

    if (condition.contains("cloud")) {
      return [
        Colors.blueGrey,
        Colors.lightBlue,
      ];
    }

    if (condition.contains("rain")) {
      return [
        Colors.indigo,
        Colors.blueGrey,
      ];
    }

    if (condition.contains("thunder")) {
      return [
        Colors.deepPurple,
        Colors.black87,
      ];
    }

    if (condition.contains("snow")) {
      return [
        Colors.white,
        Colors.lightBlueAccent,
      ];
    }

    return [
      Colors.blue,
      Colors.cyan,
    ];
  }

}