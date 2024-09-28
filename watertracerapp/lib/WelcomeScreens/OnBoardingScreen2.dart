import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/MainScreens/HomeScreen.dart';
import 'package:watertracerapp/color/appicons.dart';
import '../color/Appcolor.dart'; // Assuming Appcolor.dart contains AppColors and AppTextStyles

class OnboardingScreen2 extends StatefulWidget {
  @override
  _OnboardingScreen2State createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  int _currentIndex = 2; // Start with the third dot active
  final int _totalDots = 3; // Total dots for the slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            BottleDropIcon(),
            const SizedBox(height: 30),
            TitleText(),
            const SizedBox(height: 20),
            SubtitleText(),
            const SizedBox(height: 30),
            DotSlider(
              totalDots: _totalDots,
              currentIndex: _currentIndex,
            ),
            const SizedBox(height: 50),
            NextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(), // Navigate to the final screen
                  ),
                );
              },
            ),
            const SizedBox(height: 70),
            BottomLine(),
          ],
        ),
      ),
    );
  }
}

// Widget for the bottle drop icon
class BottleDropIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppIcons.bottleDrop(); // Assuming you have this function that returns the bottle drop image
  }
}

// Widget for the title text
class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Easy to Use – Drink, Tap,\n Repeat',
      textAlign: TextAlign.center,
      style: AppTextStyles.largeTitle,
    );
  }
}

// Widget for the subtitle text
class SubtitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Staying hydrated every day is easy with\n Drops Water Tracker.',
      textAlign: TextAlign.center,
      style: AppTextStyles.description,
    );
  }
}

// Widget for the dot slider
class DotSlider extends StatelessWidget {
  final int totalDots;
  final int currentIndex;

  DotSlider({required this.totalDots, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: currentIndex == index ? 20 : 20, // Active dot is wider
            height: 5, // Keep all dots the same height
            decoration: BoxDecoration(
              color: currentIndex == index ? AppColors.activeDotColor : AppColors.dotColor, // Active and inactive colors
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}

// Widget for the Next button
class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  NextButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Next',
      onPressed: onPressed,
    );
  }
}

// Widget for the bottom line
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
