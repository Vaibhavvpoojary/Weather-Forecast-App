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
        child: Text(snapshot.error.toString()),
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
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),


          Text(
            "📍 ${weather.city}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),


          const SizedBox(height:20),


          // Main Weather Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(25),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blueAccent,
            ),

            child: Column(

              children:[

                Text(
                  "🌤",
                  style: TextStyle(
                    fontSize:60
                  ),
                ),


                Text(
                  "${weather.temperature}°C",
                  style: TextStyle(
                    fontSize:50,
                    color:Colors.white,
                    fontWeight:FontWeight.bold
                  ),
                ),


                Text(
                  weather.condition,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:18
                  ),
                )

              ],
            ),
          ),


          SizedBox(height:20),


          Text(
            "Weather Details",
            style:TextStyle(
              fontSize:20,
              fontWeight:FontWeight.bold
            ),
          ),


          SizedBox(height:10),


          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,

            children:[

              Text(
                "💧\n${weather.humidity}%",
                textAlign:TextAlign.center,
              ),


              Text(
                "🌬\n${weather.windSpeed}",
                textAlign:TextAlign.center,
              ),

            ],
          )

        ],
      ),
    );

  },
),