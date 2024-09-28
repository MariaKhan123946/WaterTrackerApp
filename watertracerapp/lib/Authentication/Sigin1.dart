import 'package:flutter/material.dart';
import 'package:watertracerapp/Authentication/CreateAccount.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/Screens/Drinkwaterscreen.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool _isPasswordVisible = false; // For password visibility toggle

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
                  icon: Icon(Icons.close, color: AppColors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 18),

              // Title and Subtitle
              Text('Login', style: AppTextStyles.titleStyle),
              SizedBox(height: 10),
              Text('Securely login to your account', style: AppTextStyles.subtitleStyle),
              SizedBox(height: 30),

              // Email Field
              _buildTextField(Icons.email_outlined, 'Email address', false),
              SizedBox(height: 20),

              // Password Field
              _buildTextField(Icons.lock_outline, 'Password', true),
              SizedBox(height: 20),
              // Define this as a state variable

// Inside your widget tree, replace this part of your code:
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Update the state when tapped
                      isChecked = !isChecked;
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.login, width: 2),
                        color: isChecked ? AppColors.primaryColor : Colors.transparent,
                      ),
                      child: isChecked
                          ? Icon(Icons.check, size: 16, color: Colors.white) // Check icon inside
                          : null, // Empty if not checked
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between the circle and text
                  Text('Remember me', style: AppTextStyles.subtitleStyle),
                ],
              ),

              SizedBox(height: 10),
              // Login Button
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.ShadowColor.withOpacity(0.4),
                          spreadRadius: 7,
                          blurRadius: 8,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: CustomButton(
                      text: 'Login',
                      width: 200,  // Set specific width for these buttons
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount(),)); // Action for this button
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: AppTextStyles.forgotPasswordStyle),
                ),
              ),
              SizedBox(height: 10),
              // Or Continue with
              Center(
                child: Text('- OR Continue with -', style: AppTextStyles.subtitleStyle),
              ),
              SizedBox(height: 20),

              // Google and Facebook Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton('Google', 'images/google.png', AppColors.activeDotColor),
                  SizedBox(width: 10),
                  _buildSocialLoginButton('Facebook', 'images/facebook.png', AppColors.activeDotColor),
                ],
              ),
              SizedBox(height: 20),

              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Create An Account', style: AppTextStyles.subtitleStyle),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.signUpTextStyle.copyWith(
                        decoration: TextDecoration.underline, // Underline the text
                        decorationColor: AppColors.lightBlue,  // Set underline color to light blue
                      ),
                    ),
                  ),
                ],
              ),

              // Terms and Conditions
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'By clicking Continue, you agree to our ',
                      style: AppTextStyles.subtitleStyle,
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: AppTextStyles.signUpTextStyle,
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.signUpTextStyle,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Builds the Email and Password Text Fields
  Widget _buildTextField(IconData icon, String hint, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.timecontainerColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.timecontainerColor.withOpacity(0.10),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword ? !_isPasswordVisible : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          hintText: hint,
          hintStyle: AppTextStyles.subtitleStyle.copyWith(
            color: AppColors.login, // Apply the checkbox color to the text field
          ),
          border: InputBorder.none,
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.black,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          )
              : null,
        ),
      ),
    );
  }

  // Builds Social Login Button for Google and Facebook
  Widget _buildSocialLoginButton(String label, String assetPath, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        backgroundColor: AppColors.backgroundColor, // Icon and Text color
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      icon: Image.asset(
        assetPath,
        height: 24, // Adjust height to fit in the button
      ),
      label: Text(label, style: TextStyle(color: AppColors.login)),
    );
  }
}
