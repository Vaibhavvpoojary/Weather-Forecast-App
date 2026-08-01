 Mausam+ - Weather Forecast App

A modern Flutter-based Weather Forecast Application that provides real-time weather information using the OpenWeather API. The app automatically detects the user’s current location, fetches live weather data, displays hourly forecasts, and allows users to search weather information for any city around the world.

⸻

 Features

*  Automatic Current Location Detection
*  Location Permission Handling
*  Real-Time Weather Updates
*  Current Temperature (°C)
*  Feels Like Temperature
*  Weather Condition
*  Humidity
*  Wind Speed
*  Atmospheric Pressure
*  Hourly Weather Forecast
*  Search Weather by City
*  Dynamic Weather Tips
*  Weather-based Gradient Backgrounds
*  Responsive Material UI

⸻

 Application Flow

Splash Screen
      ↓
User Details Screen
      ↓
Location Permission
      ↓
Fetch Device Location
      ↓
Convert GPS Coordinates
      ↓
Call OpenWeather API
      ↓
Display Weather Dashboard
      ↓
Search Any City

⸻

Technologies Used

* Flutter
* Dart
* OpenWeather API
* Geolocator Package
* Geocoding API
* HTTP Package
* Material Design

⸻

 APIs Used

1. Current Weather API

Used to fetch:

* Temperature
* Humidity
* Wind Speed
* Pressure
* Weather Condition
* Weather Icon

Example Request

https://api.openweathermap.org/data/2.5/weather

⸻

2. 5-Day / 3-Hour Forecast API

Used for the hourly weather forecast section.

Example Request

https://api.openweathermap.org/data/2.5/forecast

⸻

3. Geocoding API

When the user searches for a city, the app first converts the city name into latitude and longitude.

Example

Bangalore
      ↓
Latitude : 12.9716
Longitude: 77.5946

API Used

https://api.openweathermap.org/geo/1.0/direct

⸻

 How Location Works

The application first requests location permission from the user.

Allow Location
      ↓
Geolocator Package
      ↓
Current Latitude & Longitude
      ↓
Weather API
      ↓
Live Weather Data

Example

Latitude  : 12.9141
Longitude : 74.8560

These coordinates are sent to the Weather API to retrieve live weather information.

⸻

🔍 How City Search Works

When a user searches for a city:

User types:
Mumbai

↓

The Geocoding API returns

Latitude
Longitude

↓

These coordinates are passed to

Current Weather API

↓

The UI refreshes with the selected city’s weather.

⸻

 Project Structure

lib
│
├── models
│   ├── weather_model.dart
│   └── forecast_model.dart
│
├── screens
│   ├── splash
│   ├── onboarding
│   └── home
│
├── services
│   ├── weather_service.dart
│   ├── location_service.dart
│   └── location_search_service.dart
│
├── widgets
│   ├── current_weather_card.dart
│   ├── weather_details_card.dart
│   ├── hourly_forecast.dart
│   ├── weather_tip.dart
│   └── search_city.dart
│
└── utils
    ├── constants.dart
    └── weather_background.dart

⸻

 Weather Information Displayed

* City Name
* Current Temperature
* Feels Like Temperature
* Weather Description
* Weather Icon
* Humidity
* Wind Speed
* Pressure
* Hourly Forecast
* Weather Tips

⸻

 Complete Working Flow

Launch App
      ↓
Splash Screen
      ↓
Enter User Name
      ↓
Grant Location Permission
      ↓
Fetch GPS Coordinates
      ↓
Call OpenWeather API
      ↓
Receive JSON Response
      ↓
Convert JSON → WeatherModel
      ↓
Update UI
      ↓
Display Live Weather
      ↓
Search Another City
      ↓
Convert City → Coordinates
      ↓
Fetch New Weather
      ↓
Update Dashboard

⸻

 Getting Started

Clone the repository

git clone https://github.com/yourusername/weather_forecast_app.git

Install dependencies

flutter pub get

Run the application

flutter run

Build Release APK

flutter build apk --release

⸻

 API Key Setup

Create an account on OpenWeather and generate an API key.

Update your API key inside:

lib/utils/constants.dart
static const apiKey = "YOUR_API_KEY";

⸻

Future Improvements

*  7-Day Forecast
*  Multiple Saved Cities
*  Favorite Locations
*  Dark Mode
*  Weather Alerts
*  Air Quality Index (AQI)
*  Sunrise & Sunset
*  Weather Maps
*  Offline Weather Cache
*  Rain Probability Charts

⸻

 Developer

Vaibhav Poojary

AI & Machine Learning Engineering Student

Built using Flutter  and the OpenWeather API.
