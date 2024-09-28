import 'package:flutter/material.dart';
import 'package:watertracerapp/BottomNavigation/Bottomnavigationnbar.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: _buildTopRow(),
            ),
            _buildTabBar(),
            SizedBox(height: 20,),
            _buildWeeklyCompletion(),
            _buildDrinkWaterReport(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }

  Widget _buildTopRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.history, color: AppColors.hColor),
              SizedBox(width: 10,),
              Text('History', style: AppTextStyles.subtitleStyle),
            ],
          ),
          Row(
            children: [
              Icon(Icons.settings_outlined, color: AppColors.activeDotColor),
              SizedBox(width: 10,),
              Text('Setting', style: AppTextStyles.settingOptionStyle),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildTabBar() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Divider(
          color: AppColors.lightBlue,
          thickness: 2.0,
        ),
      ),
      Expanded(
        flex: 1,
        child: Divider(
          color: AppColors.hColor,
          thickness: 2.0,
        ),
      ),
    ],
  );
}

Widget _buildWeeklyCompletion() {
  return Container(
    padding: EdgeInsets.all(16.0),
    color: AppColors.primaryColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Weekly Completion', style: AppTextStyles.buttonTextStyle),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDayStatus('Sun', true,),
            _buildDayStatus('Mon', true),
            _buildDayStatus('Tue', true),
            _buildDayStatus('Wed', true),
            _buildDayStatus('Thu', true),
            _buildFridayStatus(), // Custom Friday widget with transparent fill and white border
            _buildSaturdayStatus(),
          ],
        ),
      ],
    ),
  );
}

Widget _buildFridayStatus() {
  // Custom Widget for Friday
  return Column(
    children: [
      Container(
        height: 20,
        width: 20,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, // Transparent fill
          border: Border.all(
            color: Colors.white, // White border
            width: 2.0,
          ),
        ),
        // child: Icon(
        //   Icons.circle,
        //   color: AppColors.lightBlue, // Grey icon inside the transparent container
        // ),
      ),
      SizedBox(height: 5),
      Text('Fri', style: AppTextStyles.buttonTextStyle),
    ],
  );
}
Widget _buildSaturdayStatus() {
  // Custom Widget for Friday
  return Column(
    children: [
      Container(
        height: 20,
        width: 20,
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          shape: BoxShape.circle,

        ),
      ),
      // child: Icon(
      //   Icons.circle,
      //   color: AppColors.lightBlue, // Grey icon inside the transparent container
      // ),

      SizedBox(height: 5),
      Text('Sat', style: AppTextStyles.buttonTextStyle),
    ],
  );
}
Widget _buildDayStatus(String day, bool completed) {
  return Column(
    children: [
      Icon(
        completed ? Icons.check_circle : Icons.circle,
        color: completed ? AppColors.white : AppColors.primaryColor,
      ),
      SizedBox(height: 5),
      Text(day, style: AppTextStyles.buttonTextStyle),
    ],
  );
}

Widget _buildDrinkWaterReport() {
  return Expanded(
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        SizedBox(height: 20),
        Text('Drink Water Report', style: AppTextStyles.titleStyle),
        SizedBox(height: 10),
        _buildReportRow('Weekly Average', '0 ml / Day', AppColors.green),
        Divider(color: AppColors.hColor),
        _buildReportRow('Monthly Average', '0 ml / Day', AppColors.primaryColor),
        Divider(color: AppColors.hColor),
        _buildReportRow('Average Completion', '0%', AppColors.orange),
        Divider(color: AppColors.hColor),
        _buildReportRow('Drink Frequency', '0 times / Day', AppColors.red),
        Divider(color: AppColors.hColor),
      ],
    ),
  );
}
Widget _buildReportRow(String title, String value, Color dotColor) {
  return ListTile(
    leading: CircleAvatar(
      radius: 5,
      backgroundColor: dotColor,
    ),
    title: Text(title, style: AppTextStyles.subtitleStyle),
    trailing: Text(value, style: AppTextStyles.settingOptionStyle),
  );
}



