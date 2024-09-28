import 'package:flutter/material.dart';
// Define all the colors used throughout your app
class AppColors {
  static const Color backgroundColor = Color(0xFFE3F2FD);  // Light background
  static const Color white = Colors.white;  // White color
  static const Color black = Color(0xff000000);  // Black color
  static const Color titleColor = Color(0xFF000000);  // Black for titles
  static const Color descriptionColor = Color(0xFF625D5D);  // Dark grey for descriptions
  static const Color dotColor = Color(0xFFF2F2F2);  // Inactive dot color
  static const Color activeDotColor = Color(0xFF5DCCFC);  // Active dot color
  static const Color buttonColor = Color(0xFF5DCCFC);  // Light blue button
  static const Color textColor = Color(0xFF90A5B4);  // Light grey for general text
  static const Color primaryColor = Color(0xFF62CDFA);  // Main theme color (blue)
  static const Color secondaryColor = Colors.grey;  // Secondary theme color (grey)
  static const Color darkText = Color(0xFF303030);  // Dark grey text
  static const Color lightGrey = Color(0xFFF5F5F5);  // Light grey background
  static const Color darkGrey = Color(0xFF757575);  // Darker grey
  static const Color lightBlue = Color(0xFF00BFFF);  // Light blue for accents
  static const Color green = Color(0xFF4CAF50);  // Success green
  static const Color orange = Color(0xFFFFFB800);  // Warning orange
  static const Color red = Color(0xFFFFF2E00);  // Error red
  static const Color blueContainerColor = Colors.blue;  // Blue for containers
  static const Color accentColor = Color(0xff009418);
  static const Color countingColor  =Color(0xff5DCCFC);
  static var disabledColor;
  static const blackColor = Color(0xff000000);
  static const greyColor = Colors.grey;
  static const whiteColor = Colors.white;
  static const searchColor = Color(0xffF4F8FB);
  static const borderColor = Color(0xffD0DBE2);// Accent color (green)
  static const performanceColor = Color(0xff021DF1D);
  static const fillColor = Color(0xffEAF8FE);
  static const timecontainerColor = Color(0xffF4F4F4);
  static const containerColor = Color(0xff7676801F);
  static const unselectedTabStyleColor = Color(0xff7676801F);
  static const hColor = Color(0xffA3A3A3);
  static const login = Color(0xff797979);
  static const Color focusedBorderColor = Color(0xff5DCCFC);
  static const Color ShadowColor = Color(0xff3190E8);

}

// Define all the text styles used throughout your app
class AppTextStyles {
  static const TextStyle largeTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.titleColor,
  );

  static const TextStyle description = TextStyle(
    fontSize: 15,
    color: AppColors.descriptionColor,
    height: 1.5,
  );

  static const TextStyle smallTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.titleColor,
  );

  static const TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle bodyText = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const TextStyle headline = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subheadline = TextStyle(
    color: AppColors.black,
    fontSize: 14,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sliderValueStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 14,
    color: AppColors.black,
  );
  static const TextStyle labelText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle signUpTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.lightBlue,

  );


  static const TextStyle forgotPasswordStyle = TextStyle(
    fontSize: 14,
    color: AppColors.lightBlue,
    decoration: TextDecoration.underline, // Underline
    decorationColor: AppColors.lightBlue,
  );

  static const TextStyle settingOptionStyle = TextStyle(
    fontSize: 14,
    color: AppColors.activeDotColor,
  );
  static const TextStyle titleStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: AppColors.titleColor,
  );

  static const TextStyle descriptionStyle = TextStyle(
  fontSize: 16,
  color: AppColors.descriptionColor,
  );
  static const TextStyle labelStyle = TextStyle(
  fontSize: 14,
  color: AppColors.secondaryColor,
  );

  static const TextStyle headerStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: AppColors.black,
  );
  static const TextStyle countingTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.countingColor,
  );
  static const titleText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static const titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static const subtitleTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.greyColor,
  );

  static const blueContainerColor = Color(0xFF62CDFA);
  static const blueContainerTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );

  static const unitTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.blackColor,
  );
  static const TextStyle titleColor = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle goalTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static const TextStyle goalPerformance = TextStyle(
    fontSize: 10,
    color: AppColors.titleColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle date = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xff62CDFA),
  );


  static var skipTextStyle;

  static var unselectedTabStyle;
}

// Helper widgets for your app
Widget nextButton(VoidCallback onPressed) {
  return SizedBox(
    height: 55,
    width: 285,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded button shape
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: AppTextStyles.buttonTextStyle,
        ),
      ),
    ),
  );
}

// Dots slider used for indicating progress
// Widget dotSlider(int currentIndex, int totalDots) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: List.generate(totalDots, (index) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4.0),
//         child: Container(
//           width: currentIndex == index ? 12 : 15,
//           height: 5,
//           decoration: BoxDecoration(
//             color: currentIndex == index
//                 ? AppColors.activeDotColor
//                 : AppColors.dotColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       );
//     }),
//   );
// }

// Icon widget (e.g., for splash screen or other sections)
// class AppIcons {
//   static const double imageSize = 200.0;
//
//   static Widget waterDrop() {
//     return Image.asset(
//       'images/Bottle of water-bro 1.png',  // Path to your image
//       width: imageSize,
//       height: imageSize,
//       fit: BoxFit.contain,
//     );
//   }
// }
