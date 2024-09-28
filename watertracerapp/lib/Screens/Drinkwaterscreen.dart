import 'dart:math';
import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/Screens/14.dart';
import 'package:watertracerapp/color/Appcolor.dart';
class DrinkwaterScreen extends StatefulWidget {
  @override
  _DrinkwaterScreenState createState() => _DrinkwaterScreenState();
}

class _DrinkwaterScreenState extends State<DrinkwaterScreen> {
  double _sliderValue = 0; // Start at 0% for an empty state
  bool _isMaxReached = false; // Track if 100% is reached // Start at 0% for an empty state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor, // Updated for AppColors
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                      children: [
                        Positioned(
                          bottom: 230,
                          left: 0,
                          child: Image.asset(
                            'images/img_19.png',
                            width: 180,
                            height: 350,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            'images/top_right_image.png',
                            width: 200,
                            height: 190,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_back,
                                          color: AppColors.activeDotColor,),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Drink Water Glass',
                                        style: AppTextStyles.header,
                                      ),
                                      Spacer(flex: 2),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                '6 Glass\n Water',
                                                style: AppTextStyles.goalTitle,
                                              ),
                                              SizedBox(width: 10,),
                                              Icon(Icons.arrow_forward_outlined,
                                                  color: AppColors.titleColor),
                                              SizedBox(width: 10,),
                                              Column(
                                                children: List.generate(10, (index) {
                                                  return Row(
                                                    children: [
                                                      Text(
                                                        '${10 - index}',
                                                        // Updated to start from 10 to 1
                                                        style: AppTextStyles
                                                            .goalPerformance,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Container(
                                                        width: 20,
                                                        height: 2,
                                                        color: AppColors.titleColor,
                                                      ),
                                                    ],
                                                  );
                                                }),

                                              ),
                                              SizedBox(width: 2,),
                                              Align(
                                                child: Image.asset(
                                                  'images/water_glass.png',
                                                  width: 150,
                                                  height: 150,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 60, // Width of the blue line
                                        height: 4,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        'Date & Time',
                                        style: AppTextStyles.header.copyWith(
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '16 June 2023',
                                        style: AppTextStyles.date.copyWith(
                                            color: Color(0xFF303030)),
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 160),
                                            child: Text('Goal Preview',
                                                style: AppTextStyles.header),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onPanUpdate: (details) {
                                                  if (!_isMaxReached) {
                                                    // Only update if 100% is not reached yet
                                                    setState(() {
                                                      // Calculate angle based on touch position
                                                      double angle = atan2(
                                                        details.localPosition.dy - 60,
                                                        details.localPosition.dx - 60,
                                                      );
                                                      double percentage = (angle + pi) / (2 * pi) * 100;

                                                      // Ensure percentage stays between 0 and 100
                                                      if (percentage < 0) percentage = 0;
                                                      if (percentage >= 100) {
                                                        percentage = 100;
                                                        _isMaxReached = true; // Lock once 100% is reached
                                                      }

                                                      _sliderValue = percentage;
                                                    });
                                                  }
                                                },
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    // Custom circle painter for the progress
                                                    CustomPaint(
                                                      size: Size(120, 120),
                                                      painter: CircularBorderPainter(_sliderValue, _isMaxReached),
                                                    ),
                                                    // The text displaying the percentage inside the circle
                                                    Container(
                                                      width: 100,
                                                      height: 110,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_sliderValue.toInt()}%', // Display the current percentage
                                                          style: AppTextStyles.appBarTitle
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(height: 3),
                                                        _performanceIndicator(
                                                            'Athlete\nPerformance',
                                                            'images/personruning.png',
                                                            '+100%', AppColors.performanceColor),
                                                        SizedBox(height: 10),
                                                        _performanceIndicator(
                                                            'Cognitive\nPerformance',
                                                            'images/Thinkinglearning.png',
                                                            '+100%', AppColors.performanceColor),
                                                      ],
                                                    ),

                                                  ]
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        // Add some spacing before the button
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 70),
                                          child: CustomButton(
                                            text: 'Goal  Archive',
                                            width: double.infinity,  // Set specific width for these buttons
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => MainContent(),)); // Action for this button
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          height: 4,
                                          width: 150,
                                          color: AppColors.dotColor,
                                          margin: const EdgeInsets.only(bottom: 16), // Add margin if needed
                                        ),
                                      ]
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              ),
            )
        )
    );
  }

  Widget _performanceIndicator(String title, String imagePath, String performance, Color performanceColor) {
    String dynamicPerformance = _sliderValue == 100 ? '+100%' : performance; // Update performance dynamically

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.goalTitle,
              ),
              Image.asset(imagePath, height: 50),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Text(
              dynamicPerformance, // Use dynamic performance
              style: AppTextStyles.goalTitle.copyWith(color: performanceColor),
            ),
          ),
        ],
      ),
    );
  }
}
class CircularBorderPainter extends CustomPainter {
  final double percentage;
  final bool isMaxReached; // Track if max has been reached

  CircularBorderPainter(this.percentage, this.isMaxReached);

  @override
  void paint(Canvas canvas, Size size) {
    double cappedPercentage = percentage.clamp(0, 100); // Ensure it never goes above 100

    // Set paint to green if 100%, otherwise blue
    Paint filledPaint = Paint()
      ..color = isMaxReached ? Colors.green : Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Paint unfilledPaint = Paint()
      ..color = Color(0xFFF4F8FB) // Color for the unfilled portion
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double startAngle = -pi / 2; // Start at the top
    double sweepAngle = (cappedPercentage / 100) * 2 * pi; // Calculate sweep angle

    // Draw the filled arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      startAngle,
      sweepAngle,
      false,
      filledPaint,
    );

    // Only draw unfilled arc if percentage is less than 100%
    if (cappedPercentage < 100) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
        startAngle + sweepAngle,
        2 * pi - sweepAngle, // Remaining angle
        false,
        unfilledPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Repaint whenever percentage changes
  }
}
