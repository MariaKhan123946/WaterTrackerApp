import 'package:flutter/material.dart';
import 'package:watertracerapp/BottomNavigation/Bottomnavigationnbar.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }// Default to "Setting" tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              _buildTopRow(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Divider(
                      color: AppColors.hColor, // Light grey line under History
                      thickness: 1.0,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Divider(
                      color: AppColors.lightBlue, // Light blue line under Setting
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    SizedBox(height: 20),
                    Text('Reminder Settings', style: AppTextStyles.titleStyle),
                    SizedBox(height: 10),
                    _buildSettingOption('Reminder Sound'),
                    Divider(color: AppColors.hColor), // Divider below each option
                    _buildSettingOptionWithSubtitle('Reminder Mode', 'As device settings'),
                    Divider(color: AppColors.hColor),

                    SizedBox(height: 20),
                    Text('General', style: AppTextStyles.titleStyle),
                    SizedBox(height: 10),
                    _buildSettingOption('Remove ADS'),
                    Divider(color: AppColors.hColor),
                    _buildSettingOptionWithSubtitle('Light or dark interface', 'Light'),
                    Divider(color: AppColors.hColor),
                    _buildSettingOptionWithSubtitle('Unit', 'Kg. ml'),
                    Divider(color: AppColors.hColor),
                    _buildSettingOptionWithSubtitle('Intake goal', '2000 ml'),
                    Divider(color: AppColors.hColor),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }

  Widget _buildSettingOption(String title) {
    return ListTile(
      title: Text(title, style: AppTextStyles.subtitleStyle),
    );
  }

  Widget _buildSettingOptionWithSubtitle(String title, String subtitle) {
    return ListTile(
      title: Text(title, style: AppTextStyles.subtitleStyle),
      trailing: Text(subtitle, style: AppTextStyles.settingOptionStyle),
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
