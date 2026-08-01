class WeatherModel {
  final String city;

  final double temperature;
  final double feelsLike;

  final int humidity;

  final double windSpeed;

  final int pressure;

  final double rain;

  final String condition;

  final String icon;


  WeatherModel({
    required this.city,

    required this.temperature,
    required this.feelsLike,

    required this.humidity,

    required this.windSpeed,

    required this.pressure,

    required this.rain,

    required this.condition,

    required this.icon,
  });



  factory WeatherModel.fromJson(Map<String, dynamic> json) {

    return WeatherModel(

      city: json["name"],


      temperature:
          (json["main"]["temp"] as num).toDouble(),


      feelsLike:
          (json["main"]["feels_like"] as num).toDouble(),


      humidity:
          json["main"]["humidity"],


      pressure:
          json["main"]["pressure"],


      windSpeed:
          (json["wind"]["speed"] as num).toDouble(),


      rain:
          json["rain"] != null
              ? (json["rain"]["1h"] ?? 0).toDouble()
              : 0,


      condition:
          json["weather"][0]["description"],


      icon:
          json["weather"][0]["icon"],

    );
  }
}