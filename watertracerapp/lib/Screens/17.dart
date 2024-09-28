import 'dart:math';
import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/color/Appcolor.dart';

import 'Drinkwaterscreen.dart';

class GoalScreen extends StatefulWidget {
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  double _sliderValue = 0; // Start at 0% for an empty state

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
                                  icon: Icon(Icons.arrow_back,color: AppColors.activeDotColor,),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '6 Glass\n Water',
                                          style: AppTextStyles.goalTitle,
                                        ),
                                        SizedBox(width: 10,),
                                        Icon(Icons.arrow_forward_outlined, color: AppColors.titleColor),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: List.generate(10, (index) {
                                            return Row(
                                              children: [
                                                Text(
                                                  '${10 - index}', // Updated to start from 10 to 1
                                                  style:  AppTextStyles.goalPerformance,
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
                                  style: AppTextStyles.header.copyWith(color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '16 June 2023',
                                  style: AppTextStyles.date.copyWith(color: Color(0xFF303030)),
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
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 160),
                                    child: Text('Goal Preview', style: AppTextStyles.header),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onPanUpdate: (details) {
                                          // Calculate the angle of the gesture and update the slider value
                                          double angle = atan2(
                                            details.localPosition.dy - 60,
                                            details.localPosition.dx - 60,
                                          );

                                          // Convert angle to percentage (0 to 100)
                                          double percentage = (angle + pi) / (2 * pi) * 100;
                                          if (percentage < 0) percentage = 0;
                                          if (percentage > 100) percentage = 100;

                                          setState(() {
                                            _sliderValue = percentage; // Update slider value
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // Outer static border
                                            CustomPaint(
                                              size: Size(120, 120),
                                              painter: CircularBorderPainter(_sliderValue),
                                            ),
                                            // Inner container showing the percentage
                                            Container(
                                              width: 100,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${_sliderValue.toInt()}%', // Display the percentage
                                                  style: AppTextStyles.header.copyWith(color: Colors.black),
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
                                              _performanceIndicator('Athlete\nPerformance', 'images/personruning.png', '-60%', AppColors.red),
                                              SizedBox(height: 10),
                                              _performanceIndicator('Cognitive\nPerformance', 'images/Thinkinglearning.png', '-50%', AppColors.red),
                                    ],
                                  ),

                                                ]
                                              ),

                                            ],
                                          ),
                                ),
                                SizedBox(height: 10), // Add some spacing before the button
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 60),
                                  child: CustomButton(
                                    text: 'Goal Not Archive',
                                    width: double.infinity,  // Set specific width for these buttons
                                    onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkwaterScreen(),)); // Action for this button
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
        ),


    )
    );
  }

  Widget _performanceIndicator(String title, String imagePath, String performance, Color performanceColor) {
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
              performance,
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

  CircularBorderPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint filledPaint = Paint()
      ..color = Colors.blue // Color for the filled portion
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    Paint unfilledPaint = Paint()
      ..color = Color(0xFFF4F8FB) // Color for the unfilled portion
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    double startAngle = -pi / 2; // Start at the top
    double sweepAngle = (percentage / 100) * 2 * pi; // Calculate the sweep angle

    // Draw the filled arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      startAngle,
      sweepAngle,
      false,
      filledPaint,
    );
    // Draw the unfilled arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      startAngle + sweepAngle,
      2 * pi - sweepAngle, // Remaining angle
      false,
      unfilledPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Repaint whenever percentage changes
  }
}


