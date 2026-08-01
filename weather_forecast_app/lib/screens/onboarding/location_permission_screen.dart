import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../services/location_service.dart';
import '../home/home_screen.dart';

class LocationPermissionScreen extends StatefulWidget {
  final String userName;
  
  const LocationPermissionScreen({super.key, required this.userName});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState
    extends State<LocationPermissionScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    setState(() {
      isLoading = true;
    });

    Position? position = await LocationService.getCurrentLocation();

    if (position == null) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Unable to access location. Please enable GPS and grant permission.",
          ),
        ),
      );

      return;
    }

    String city = await LocationService.getCityName(
      position.latitude,
      position.longitude,
    );

    setState(() {
      isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          city: city,
          latitude: position.latitude,
          longitude: position.longitude,
          userName: userName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 100,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Enable Location",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Mausam+ needs your location to provide accurate weather updates.",
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: _getLocation,
                        icon: const Icon(Icons.my_location),
                        label: const Text(
                          "Use Current Location",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            city: "Unknown",
                            latitude: 0,
                            longitude: 0,
                            userName: userName,
                          ),
                        ),
                      );
                      },
                      child: const Text("Skip for Now"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}