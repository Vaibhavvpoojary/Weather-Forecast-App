import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {

        // Navigate to User Details Screen

      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [

              Color(0xff4FACFE),

              Color(0xff00C6FB),

            ],

          ),

        ),

        child: const Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(

                Icons.wb_sunny_rounded,

                color: Colors.amber,

                size: 90,

              ),

              SizedBox(height: 20),

              Text(

                "Mausam+",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 38,

                  fontWeight: FontWeight.bold,

                  letterSpacing: 1.5,

                ),

              ),

              SizedBox(height: 10),

              Text(

                "Your Daily Weather Companion",

                style: TextStyle(

                  color: Colors.white70,

                  fontSize: 16,

                ),

              ),

              SizedBox(height: 50),

              CircularProgressIndicator(

                color: Colors.white,

              ),

            ],

          ),

        ),

      ),

    );

  }

}