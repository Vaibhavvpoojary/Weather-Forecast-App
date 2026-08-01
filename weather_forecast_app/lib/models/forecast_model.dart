class ForecastModel {

  final String time;
  final double temperature;
  final String icon;
  final double rain;


  ForecastModel({

    required this.time,

    required this.temperature,

    required this.icon,

    required this.rain,

  });



  factory ForecastModel.fromJson(
      Map<String,dynamic> json
      ){

    return ForecastModel(

      time: json["dt_txt"],

      temperature:
      (json["main"]["temp"] as num).toDouble(),

      icon:
      json["weather"][0]["icon"],

      rain: json["rain"] != null 
          ? (json["rain"]["3h"] ?? 0).toDouble() 
          : 0.0,

    );

  }

}