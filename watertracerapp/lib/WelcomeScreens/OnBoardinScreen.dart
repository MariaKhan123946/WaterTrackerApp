import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/WelcomeScreens/OnBoardingScreen1.dart';
import 'package:watertracerapp/color/appicons.dart';
import '../color/Appcolor.dart'; // Assuming Appcolor.dart contains AppColors and AppTextStyles

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0; // Start with the first dot active
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
            WaterDropIcon(),
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
                setState(() {
                  _currentIndex++;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreen1(),
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

// Widget for the water drop icon
class WaterDropIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppIcons.waterDrop(); // Assuming you have this function that returns the water drop image
  }
}

// Widget for the title text
class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Track your daily water\n intake with Us.',
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
      'Achieve your hydration goals with a simple tap!',
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
