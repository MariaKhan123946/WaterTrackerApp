import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watertracerapp/WelcomeScreens/OnBoardinScreen.dart';
import 'package:watertracerapp/color/Appcolor.dart';
import 'package:watertracerapp/color/appicons.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to OnboardingScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.activeDotColor,
      body: Stack(
        children: [
          // Content Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: AppIcons.WaterDropIcon(),
                ),
                SizedBox(height: 10),
                AppTitle(),
                SizedBox(height: 8),
                AppSubtitle(),
                SizedBox(height: 20),
                LoadingDots(),
                Spacer(),
                BottomLine(),
                SizedBox(height: 10,),
              ],
            ),
          ),

          // Overlapping Wave Images at the Bottom
          OverlappingWaves(),
        ],
      ),
    );
  }
}

// Widget for the App Title
class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Drops Water Tracker',
      textAlign: TextAlign.center,
      style: AppTextStyles.largeTitle,
    );
  }
}

// Widget for the App Subtitle
class AppSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Stay hydrated and track your\n daily water intake',
      textAlign: TextAlign.center,
      style: AppTextStyles.description,
    );
  }
}

// Widget for Loading Dots
class LoadingDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        SizedBox(width: 5),
        _buildDot(),
        SizedBox(width: 5),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

// Widget for Overlapping Waves
class OverlappingWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/Firstwave.png', // First wave image
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/Secondwave.png', // Second overlapping wave image
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 150,
      color: AppColors.dotColor,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
