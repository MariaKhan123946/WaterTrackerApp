import 'package:flutter/material.dart';
import 'package:watertracerapp/BottomNavigation/Bottomnavigationnbar.dart';
import 'package:watertracerapp/color/Appcolor.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController = TextEditingController(text: 'Aashifa');
  final TextEditingController lastNameController = TextEditingController(text: 'Sheikh');
  final TextEditingController emailController = TextEditingController(text: 'aashifasheikh@gmail.com');
  final TextEditingController ageController = TextEditingController(text: '25');

  String selectedGender = 'Female';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Edit Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context); // Back navigation
                    }, icon: Icon(Icons.arrow_back_sharp,color: AppColors.primaryColor,size: 30,)),
                    Text('My Profile', style: AppTextStyles.appBarTitle,),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: AppColors.white,size: 20,),
                          onPressed: () {
                            // Edit action
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Profile Avatar
                CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.asset('images/53571 1.png'), // Replace with actual image asset
                  ),
                ),
                SizedBox(height: 20),

                // First Name
                CustomTextField(
                  label: 'First Name',
                  controller: firstNameController,
                ),

                // Last Name
                CustomTextField(
                  label: 'Last Name',
                  controller: lastNameController,
                ),

                // Email Address
                CustomTextField(
                  label: 'Email Address',
                  controller: emailController,
                  readOnly: true,
                ),

                // Age
                CustomTextField(
                  label: 'Age',
                  controller: ageController,
                ),

                // Gender Selection
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender',
                      style: AppTextStyles.labelText,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RadioOption(
                      label: 'Male',
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    RadioOption(
                      label: 'Female',
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    RadioOption(
                      label: 'Other',
                      value: 'Other',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        )
    );
  }
}

// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;

  CustomTextField({
    required this.label,
    required this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.labelText,
          ),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Radio Option Widget
class RadioOption extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  RadioOption({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
        ),
        Text(label, style: AppTextStyles.bodyText),
      ],
    );
  }
}

// Update Button Widget

