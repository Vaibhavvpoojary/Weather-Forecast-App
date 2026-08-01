class ForecastModel {

  final String time;
  final double temperature;
  final String icon;


  ForecastModel({

    required this.time,

    required this.temperature,

    required this.icon,

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

    );

  }

}