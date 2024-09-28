import 'package:flutter/material.dart';
import 'package:watertracerapp/BottomNavigation/Bottomnavigationnbar.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/MainScreens/Analysis.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info and Notification Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning,",
                          style: AppTextStyles.labelStyle,
                        ),
                        Text(
                          "Aashifa Sheikh",
                          style: AppTextStyles.titleStyle,
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.notifications,
                                color: AppColors.activeDotColor),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 5,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Water Intake Goal Card with Layering
                buildGoalCardWithLayers(),
                SizedBox(height: 20),
                // Water Intake Progress with layers
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          buildWaterIntakeProgressWithLayers(),
                          Positioned(
                            top: -10,
                            right: -30,
                            child: Column(
                              children: [
                                buildTargetContainer(),
                                SizedBox(height: 20),
                                buildTodayContainer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Go To Dashboard Button
                buildGoToDashboardButton(),
                SizedBox(height: 20),
                // Bottom Text
                Center(
                  child: Text(
                    "You got 50% of today's goal,\n keep focus on your health!",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.labelStyle,
                  ),
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

  Widget buildGoalCardWithLayers() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "11:00 AM",
                      style: AppTextStyles.headerStyle,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "200ml water (2 Glass)",
                      style: AppTextStyles.descriptionStyle,
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Image.asset(
                  'images/img_30.png',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Stack(
            children: [
              Image.asset(
                'images/img_27.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/img_26.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 23,
                left: MediaQuery
                    .of(context)
                    .size
                    .width * 0.10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Add Your Goal",
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
              Positioned(
                right: -3,
                bottom: -0,
                child: Image.asset(
                  'images/img_30.png',
                  height: 180,
                  width: 150,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTargetContainer() {
    return Container(
      width: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("9:30 AM", style: AppTextStyles.labelStyle),
                  SizedBox(width: 8),
                  Container(
                    height: 5,
                    width: 40,
                    color: AppColors.activeDotColor,
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset('images/soup.png', height: 20),
                  Text("100ml", style: AppTextStyles.headerStyle),
                  SizedBox(width: 20),
                  Text("10%", style: AppTextStyles.descriptionStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTodayContainer() {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Target", style: AppTextStyles.labelStyle),
              SizedBox(height: 5),
              Text("2000ml",
                  style: TextStyle(fontSize: 20, color: AppColors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWaterIntakeProgressWithLayers() {
    return Padding(
      padding: const EdgeInsets.only(right: 110),
      child: Container(
        width: 180, // Set width for a perfect circle
        height: 180, // Set height for a perfect circle
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffADE5FC), width: 10),
          // Border color and width
          shape: BoxShape.circle,
          // Circular shape
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: ClipOval( // Ensures content inside stays within the circular shape
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'images/img_27.png', // Background image
                height: 180, // Match the container's height
                width: 180, // Match the container's width
                fit: BoxFit.cover, // Ensure the image covers the entire area
              ),
              Positioned(
                top: 7, // Position the overlay image within the circle
                child: Image.asset(
                  'images/img_26.png', // Overlay image
                  height: 180, // Adjust height to fit inside the circle
                  width: 180, // Adjust width to fit inside the circle
                  fit: BoxFit
                      .contain, // Ensure the image fits inside without stretching
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(
                    "500ml",
                    style: AppTextStyles.buttonTextStyle,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildGoToDashboardButton() {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: CustomButton(
              text: 'Go To Dashboard',
              width: double.infinity, // Specific width for this screen
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AnalysisScreen(),));
              }
          ),
        )

      // Handle the button action
    );
  }


}