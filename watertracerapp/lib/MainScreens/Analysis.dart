
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:watertracerapp/BottomNavigation/Bottomnavigationnbar.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class AnalysisScreen extends StatefulWidget {

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "For Today",
              style: AppTextStyles.titleStyle,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildWaterCard(),
                    SizedBox(width: 16),
                    Expanded(child: _buildStepCard()),
                  ],
                ),
                SizedBox(height: 10), // Add spacing between rows
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _buildCaloriesCard(), // Calories Card
                          SizedBox(height: 20), // Add spacing between stacked containers
                          _buildSleepCard(), // Sleep Card
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Expanded(child: _buildHeartCard()),
                    ), // Heart Card
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }

  // Water Card with progressive fill levels
  Widget _buildWaterCard() {
    return Container(
      height: 236,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffD0D0D0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Water",
              style: AppTextStyles.titleStyle,
            ),
          ),
          SizedBox(height: 5,),
          // Bar chart-like rectangles
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                _buildContainer(1.0),
                SizedBox(width: 8), // Full
                _buildContainer(0.8), // 80%
                SizedBox(width: 8),
                _buildContainer(0.6), // 60%
                SizedBox(width: 8),
                _buildContainer(0.4), // 40%
                SizedBox(width: 8),
                _buildContainer(0.2), // 20%
                SizedBox(width: 8),
                _buildContainer(0), // Empty
                SizedBox(width: 8),
                _buildContainer(0), // Empty
                SizedBox(width: 8),
                _buildContainer(0), // Empty
              ],
            ),
          ),
          // Line below all bars
          _buildSingleLine(),
          SizedBox(height: 10,),
          // Use two images but position them seamlessly
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'images/img_24.png', // Background image
                height: 91,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0, // Aligning the second image at the top
                child: Image.asset(
                  'images/img_25.png', // Overlay image with the same fit
                  height: 91,
                  width: 150, // Match the width of the container
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  "2.1 liters",
                  style: AppTextStyles.buttonTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSingleLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: 1, // Thickness of the line
        width: 115, // Extend the line to the full width of the water card
        color: Color(0xff3089DB54), // Color of the line
      ),
    );
  }

  // Bar chart-like rectangle widget for the Water card
  Widget _buildContainer(double fillLevel) {
    return Container(
      width: 6,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xffEAF8FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: fillLevel * 80,
          decoration: BoxDecoration(
            color: fillLevel > 0 ? Color(0xff5DCCFC) : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  // Step Card with Circular Progress Indicator
  Widget _buildStepCard() {
    return Container(
      height: 236,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffD0D0D0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Walk",
              style: AppTextStyles.titleStyle,
            ),
            SizedBox(height: 10,),
            Container(
              height: 120,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 140,
                      child: CircularProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xff5DCCFC),),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2628",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.countingTextStyle,
                        ),
                        Text(
                            "Steps\n Completed",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.headerStyle
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  // Calories Card
  Widget _buildCaloriesCard() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffD0D0D0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calories",
              style: AppTextStyles.titleStyle,
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "510.43",
                  style:AppTextStyles.countingTextStyle,
                ),

                SizedBox(height: 1,),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                      "Kcol",
                      style: AppTextStyles.bodyText
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  // Sleep Card
  Widget _buildSleepCard() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffD0D0D0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sleep",
              style: AppTextStyles.titleStyle,
            ),
            SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "08:00 ",
                  style: AppTextStyles.countingTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "hours",
                    style: AppTextStyles.bodyText,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  // Heart Card with gradient and wave effect
  Widget _buildHeartCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          height: 320,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffD0D0D0)),
          ),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70,top: 5),
                      child: Text(
                          "Heart",
                          style:AppTextStyles.titleStyle),
                    ),
                    SizedBox(height: 5,),
                    // Heart and wave stack
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Heart icon
                        Icon(
                          Icons.favorite_border,
                          size: 150,
                          color: Color(0xffFE8080), // Red heart color
                        ),
                        // Heartbeat-like wave going through the heart
                        Positioned(
                          top: 60, // To align the wave with the heart's center
                          child: Container(
                            width: 140,
                            height: 40,
                            child: CustomPaint(
                              painter: HeartWavePainter(), // Custom wave painter
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Gradient wave container
                    Stack(
                      alignment: Alignment.center, // Centers all content inside the stack
                      children: [
                        Image.asset(
                          'images/img_35.png', // Your wave image asset
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover, // Ensures the image covers the width
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40,right: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '105',
                                style: AppTextStyles.countingTextStyle,
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'bpm',
                                style: AppTextStyles.headerStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]
              )
          )
      ),
    );
  }
}


// Custom painter for the wave inside the heart (heartbeat line)
// Custom painter for the wave inside the heart (heartbeat line)
class HeartWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlueAccent // Wave color set to blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path();
    final middle = size.width / 2;

    // Drawing a heartbeat-like line that goes through the heart
    path.moveTo(0, size.height / 2);
    path.lineTo(middle - 20, size.height / 2);
    path.lineTo(middle - 10, size.height / 4); // Upward spike
    path.lineTo(middle, size.height * 3 / 4);  // Downward dip
    path.lineTo(middle + 10, size.height / 4); // Upward spike
    path.lineTo(middle + 20, size.height / 2);
    path.lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Custom painter for the deep wave at the bottom of the heart container
class DeepWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent // Blue wave color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Drawing deep waves for the border of the gradient container
    path.moveTo(0, size.height / 2);
    for (double i = 0; i < size.width; i++) {
      path.lineTo(i, size.height / 2 + 15 * sin(i * 0.04)); // Adjust wave depth
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}