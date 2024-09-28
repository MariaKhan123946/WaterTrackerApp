import 'package:flutter/material.dart';
import 'package:watertracerapp/Button/custombutton.dart';
import 'package:watertracerapp/color/Appcolor.dart';

import 'varificationcodescreen2.dart';

class VerificationCodeScreen extends StatefulWidget {
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  // List of FocusNodes for each input box to track focus changes
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    // Dispose the FocusNodes when not needed to avoid memory leaks
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button inside a small circular container
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
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
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Verification Code Text
              Text(
                'Verification Code',
                style: AppTextStyles.headerStyle,
              ),
              SizedBox(height: 10),

              // Description Text
              Text(
                'We sent you a 4-digit code to your email address. Please check & enter your code.',
                style: AppTextStyles.descriptionStyle,
              ),
              SizedBox(height: 40),

              // Row for 4 code input containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCodeInputBox(context, 0),
                  _buildCodeInputBox(context, 1),
                  _buildCodeInputBox(context, 2),
                  _buildCodeInputBox(context, 3),
                ],
              ),
              SizedBox(height: 40),

              // Verify Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodeScreen2(),));
                    print("Update button pressed");
                    // Uncomment the next line to enable navigation
                    // Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn’t Receive the Code?', style: AppTextStyles.subtitleStyle),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
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

  // Helper function to build the code input boxes with focus detection
  Widget _buildCodeInputBox(BuildContext context, int index) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: focusNodes[index].hasFocus
              ? AppColors.focusedBorderColor
              : AppColors.borderColor,
        ),
      ),
      child: Center(
        child: TextField(
          focusNode: focusNodes[index],
          onTap: () {
            setState(() {});
          },
          onChanged: (value) {
            if (value.length == 1 && index < 3) {
              FocusScope.of(context).nextFocus(); // Move focus to the next field
            }
          },
          textAlign: TextAlign.center,
          style: AppTextStyles.inputTextStyle,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '', // Hides the character count
          ),
        ),

      ),
    );
  }
}
