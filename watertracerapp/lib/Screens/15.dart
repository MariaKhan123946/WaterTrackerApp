import 'package:flutter/material.dart';
import 'package:watertracerapp/Authentication/Sigin1.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/Screens/15.dart'; // Ensure this path is correct
import 'package:watertracerapp/color/Appcolor.dart';

import '../BottomLine/BottomLine.dart';
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space content between
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Top Text Widget Call
                      CustomTextWidget(
                        content: 'Today - 16 June',
                        style: AppTextStyles.smallTitle,
                      ),
                      SizedBox(height: 16),

                      // Bottom Text Widget Call
                      CustomTextWidget(
                        content: 'Hi, Aashifa Sheikh',
                        style: AppTextStyles.title,
                      ),
                      SizedBox(height: 16),

                      // Center Image Widget Call
                      CenterImageWidget(),
                      SizedBox(height: 16),

                      // Information Container Widget Call
                      InfoContainerWidget(),
                      SizedBox(height: 40), // Adjusted space for better layout

                      // Go to Home Button Widget Call
                      GoToHomeButtonWidget(),
                      SizedBox(height: 40,),
                      BottomLine(),
                    ],
                  ),
                ),

                // Bottom Left Image Widget Call
                Positioned(
                  bottom:90,
                  left: 50,
                  child: BottomLeftImageWidget(),
                ),
              ],
            ),

            // Container at the bottom of the screen
            // Add margin if needed

          ],
        ),
      ),
    );
  }
}

// Custom reusable text widget
class CustomTextWidget extends StatelessWidget {
  final String content;
  final TextStyle style;
  final TextAlign textAlign;

  CustomTextWidget({
    required this.content,
    required this.style,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: style,
      textAlign: textAlign,
    );
  }
}

// Go to Home Button widget using CustomButton
class GoToHomeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70), // Simplified padding
      child: CustomButton(
        text: 'Go to Home',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          // Navigation logic for the Go to Home button
          print("Go to Home button pressed");
          // Uncomment the next line to enable navigation
          // Navigator.pushNamed(context, '/home');
        },
      ),
    );
  }
}

// Center Image Widget😊
class CenterImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('images/sad-svgrepo-com 1.png', height: 100);
  }
}

// Info Container Widget with confetti image
class InfoContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 340,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xFFEAF8FE),
            borderRadius: BorderRadius.circular(40), // Simplified rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CustomTextWidget(
                  content: 'Oops!',
                  style: AppTextStyles.largeTitle,
                ),
              ),
              SizedBox(height: 8),
              CustomTextWidget(
                content: 'Harry has not archive your\n goal today',
                style: AppTextStyles.smallTitle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              CustomTextWidget(
                content: 'Success is not final, failure\n is not fatal: it is the courage to continue that count.',
                style: AppTextStyles.description,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: -20,
          child: Image.asset('images/confetti.png', height: 80),
        ),
      ],
    );
  }
}

// Bottom Left Image widget
class BottomLeftImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('images/GoldTrophy.png', height: 170);
  }
}
