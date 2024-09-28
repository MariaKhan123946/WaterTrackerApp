import 'package:flutter/material.dart';
import 'package:watertracerapp/Authentication/VarificationCode.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _isPasswordVisible = false; // Manage password visibility state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close Icon
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.close, color: AppColors.black), // Icon color set to black
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 20),

              // Title and Subtitle
              Text('Create an account', style: AppTextStyles.titleStyle),
              SizedBox(height: 10),
              Text('Securely create your account', style: AppTextStyles.subtitleStyle),
              SizedBox(height: 30),

              // Full Name Field
              _buildTextField(Icons.person_outline, 'Full Name', false),
              SizedBox(height: 20),

              // Email Field
              _buildTextField(Icons.email_outlined, 'Email address', false),
              SizedBox(height: 20),

              // Phone Number Field
              _buildPhoneNumberField(),
              SizedBox(height: 20),

              // Password Field with visibility toggle
              _buildPasswordField(),

              SizedBox(height: 30),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightGrey,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      text: 'Create Account',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  VerificationCodeScreen (),));
                        print("Update button pressed");
                        // Uncomment the next line to enable navigation
                        // Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I Already Have an Account', style: AppTextStyles.subtitleStyle),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign In',
                      style: AppTextStyles.signUpTextStyle.copyWith(
                        decoration: TextDecoration.underline, // Underline the text
                        decorationColor: AppColors.lightBlue,  // Set underline color to light blue
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.timecontainerColor, // Set the fill color to timecontainerColor
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.lightBlue), // Icon color set to light blue
          hintText: hint,
          hintStyle: AppTextStyles.subtitleStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.timecontainerColor, // Set the fill color to timecontainerColor
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('images/nijarea.png', width: 30, height: 20), // Use your image asset here
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
                hintStyle: AppTextStyles.subtitleStyle,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.timecontainerColor, // Set the fill color to timecontainerColor
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        obscureText: !_isPasswordVisible, // Toggle visibility
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline, color: AppColors.lightBlue), // Icon color set to light blue
          hintText: 'Password',
          hintStyle: AppTextStyles.subtitleStyle,
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.black,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
