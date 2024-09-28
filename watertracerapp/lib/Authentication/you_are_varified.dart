import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/color/Appcolor.dart';

import 'varificationcodescreen2.dart';

// Define reusable color and text style widgets/constants


class VerifiedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Centered Image
              Center(
                child: Image.asset(
                  'images/verified_icon.png', // Replace with your image asset
                  width: 160,
                  height: 200,
                ),
              ),
              SizedBox(height: 30),

              // 'You are Verified' Text
              Text(
                'You are Verified',
                style: AppTextStyles.headerStyle
              ),
              SizedBox(height: 10),
              // 'Congratulations' Text
              Text(
                'Congratulations to you.You are now Verified!\n                    Kindly proceed to login.',
                textAlign: TextAlign.start,
                style: AppTextStyles.descriptionStyle,
              ),
              SizedBox(height: 40),
              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodeScreen2(),));
                    print("Update button pressed");
                    // Uncomment the next line to enable navigation
                    // Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
