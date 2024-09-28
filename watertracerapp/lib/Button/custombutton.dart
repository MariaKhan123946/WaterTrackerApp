import 'package:flutter/material.dart';
import 'package:watertracerapp/color/Appcolor.dart';
// Reusable CustomButton widget
class CustomButton extends StatelessWidget {
  final String text;  // Button text
  final VoidCallback onPressed;  // Action on button press
  final double? width;  // Optional width
  final double? height;  // Optional height
  final bool showShadow;  // Whether to show shadow below button

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,  // Default to full width if not provided
      height: height ?? 50,  // Default height if not provided
      decoration: BoxDecoration(
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonColor,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.buttonTextStyle,
        ),
      ),
    );
  }
}
