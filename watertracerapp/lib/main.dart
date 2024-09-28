import 'package:flutter/material.dart';
import 'package:watertracerapp/Screens/14.dart';
import 'package:watertracerapp/Screens/15.dart';
import 'package:watertracerapp/Screens/17.dart';
import 'package:watertracerapp/Screens/AppWeightGenderscreen.dart';
import 'package:watertracerapp/Screens/Drinkwaterscreen.dart';
import 'package:watertracerapp/WelcomeScreens/SplashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MainContent(),
    );
  }
}

