import 'package:flutter/material.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class AgeWeightGenderScreen extends StatefulWidget {
  @override
  _AgeWeightGenderScreenState createState() => _AgeWeightGenderScreenState();
}

class _AgeWeightGenderScreenState extends State<AgeWeightGenderScreen> {
  double age = 33;
  double weight = 57;
  double height = 125;
  String selectedGender = 'Female';
  TimeOfDay wakeUpTime = TimeOfDay(hour: 9, minute: 41);
  TimeOfDay sleepTime = TimeOfDay(hour: 10, minute: 41);

  bool wakeUpEnabled = false;
  bool sleepTimeEnabled = false;

  Future<void> _selectTime(BuildContext context, bool isWakeUp) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isWakeUp ? wakeUpTime : sleepTime,
    );
    if (picked != null) {
      setState(() {
        if (isWakeUp) {
          wakeUpTime = picked;
        } else {
          sleepTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context); // Back navigation
                      },
                      icon: Icon(
                          Icons.arrow_back_sharp, color: AppColors.primaryColor,
                          size: 30),
                    ),
                    SizedBox(width: 22),
                    Text('Select your age, weight,\n gender and height',
                        style: AppTextStyles.appBarTitle),
                  ],
                ),
                SizedBox(height: 16),
                Text("What is your gender", style: AppTextStyles.headline),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GenderOption(
                      gender: 'Male',
                      selectedGender: selectedGender,
                      onSelect: () {
                        setState(() {
                          selectedGender = 'Male';
                        });
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Add padding inside container
                        child: Image.asset('images/male.png',
                            height: 90), // Image with padding
                      ),
                      borderColor: Color(0xFF5DCCFC),
                      fillColor: Color(0xFFEAF8FE),
                    ),
                    GenderOption(
                      gender: 'Female',
                      selectedGender: selectedGender,
                      onSelect: () {
                        setState(() {
                          selectedGender = 'Female';
                        });
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Add padding inside container
                        child: Image.asset('images/Femail.png',
                            height: 90), // Image with padding
                      ),
                      borderColor: Color(0xFF5DCCFC),
                      fillColor: Color(0xFFEAF8FE),
                    ),
                    GenderOption(
                      gender: 'Other',
                      selectedGender: selectedGender,
                      onSelect: () {
                        setState(() {
                          selectedGender = 'Other';
                        });
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Add padding inside container
                        child: Image.asset('images/Other.png',
                            height: 90), // Image with padding
                      ),
                      borderColor: Color(0xFF5DCCFC),
                      fillColor: Color(0xFFEAF8FE),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                buildSlider(
                  "How old are you",
                  age,
                  100,
                      (newValue) {
                    setState(() {
                      age = newValue;
                    });
                  },
                  minLabel: "0",
                  maxLabel: "100",
                ),
                buildSlider(
                  "What is your weight (in kg)",
                  weight,
                  200,
                      (newValue) {
                    setState(() {
                      weight = newValue;
                    });
                  },
                  minLabel: "0",
                  maxLabel: "200",
                ),
                buildSlider(
                  "What is your height (in cm)",
                  height,
                  200,
                      (newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                  minLabel: "0",
                  maxLabel: "200",
                ),
                SizedBox(height: 24),
                buildTimeSection(
                    "Wake up time", wakeUpTime, wakeUpEnabled, true),
                SizedBox(height: 16),
                buildTimeSection(
                    "Sleeping time", sleepTime, sleepTimeEnabled, false),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle skip
                      },
                      child: Text("← Skip", style: AppTextStyles.settingOptionStyle),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle next
                      },
                      child: Row(
                        children: [
                          Text("Next →", style: AppTextStyles.signUpTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 4,
                    width: 150,
                    color: AppColors.dotColor,
                  ),
                ),
              ],
            ),

          ),

        ),

      ),

    );
  }

  Widget buildSlider(String label, double value, double max,
      Function(double) onChanged,
      {required String minLabel, required String maxLabel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.headline),
        SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                thumbColor: AppColors.primaryColor,
                activeTrackColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.secondaryColor,
              ),
              child: Slider(
                value: value,
                min: 0,
                max: max,
                divisions: max.toInt(),
                onChanged: (newValue) {
                  onChanged(newValue);
                  setState(() {
                    value =
                        newValue; // Updating the value to move the container
                  });
                },
              ),
            ),
            Positioned(
              left: (value / max) * MediaQuery
                  .of(context)
                  .size
                  .width * 0.75, // Adjusting position dynamically
              child: Container(
                width: 50,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.dotColor),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white,
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "${value.toInt()}",
                  style: AppTextStyles.sliderValueStyle,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(minLabel),
            Text(maxLabel),
          ],
        ),
      ],
    );
  }

  Widget buildTimeSection(String label, TimeOfDay time, bool isEnabled,
      bool isWakeUp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.headline),
        SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: isEnabled ? () => _selectTime(context, isWakeUp) : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${time.hour}:${time.minute.toString().padLeft(2, '0')}",
                  // Time without AM/PM
                  style: TextStyle(
                    fontSize: 18,
                    color: isEnabled ? AppColors.textColor : AppColors
                        .disabledColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.timecontainerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // Makes sure the column takes the minimum space required
                children: [
                  // AM Container
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: isWakeUp ?AppColors.backgroundColor :AppColors.timecontainerColor
                          , // Light blue for AM
                      borderRadius: BorderRadius.circular(8),
                      border: isWakeUp ? Border.all(
                        color: AppColors.countingColor, // Blue border for AM
                        width: 1.5,
                      ) : Border.all(
                          color: Colors.transparent), // No border for "Off"
                    ),
                    child: Text(
                      isWakeUp ? "AM" : "Off", // Shows AM if wake-up, else Off
                      style: TextStyle(
                        fontSize: 18,
                        color: isWakeUp ? AppColors.black : AppColors.black, // Text color for AM/Off
                      ),
                    ),
                  ),
                  SizedBox(width: 5), // Space between the two containers
                  // PM Container
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: !isWakeUp ? AppColors.backgroundColor :AppColors.timecontainerColor, // Light blue for PM
                      borderRadius: BorderRadius.circular(8),
                      border: !isWakeUp ? Border.all(
                        color: AppColors.countingColor, // Blue border for PM
                        width: 1.5,
                      ) : Border.all(
                          color: Colors.transparent), // No border for "Off"
                    ),
                    child: Text(
                      !isWakeUp ? "PM" : "Off",
                      // Shows PM if not wake-up, else Off
                      style: TextStyle(
                        fontSize: 18,
                        color: !isWakeUp ? AppColors.black : AppColors.black, // Text color for PM/Off
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ],
    );
  }
}
  class GenderOption extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final VoidCallback onSelect;
  final Widget icon;
  final Color borderColor;
  final Color fillColor;

  GenderOption({
    required this.gender,
    required this.selectedGender,
    required this.onSelect,
    required this.icon,
    required this.borderColor,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Stack(
        children: [
          Container(
            height: 100, // Adjust height as needed
            width: 100,  // Adjust width as needed
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedGender == gender ? borderColor : AppColors.countingColor,
                width: 3, // Border width
              ),
              color: fillColor,
              shape: BoxShape.circle, // Making the container circular
            ),
            child: icon, // The image/icon inside the container
          ),
          if (selectedGender == gender)
            Positioned(
              bottom: 0,  // Position at the bottom edge
              right: 0,   // Align to the bottom-right corner
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.green, // Background color for the check icon
                  shape: BoxShape.circle,
                  border: Border.all( // Ensure the check icon has its own border
                    color: borderColor,
                    width: 3, // Border thickness around the check icon
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.white, // Color of the check mark
                ),
              ),
            ),
        ],
      ),
    );
  }
}



