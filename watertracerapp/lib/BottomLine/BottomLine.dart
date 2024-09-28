import 'package:flutter/material.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class BottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 150,
      color: AppColors.dotColor,
    );
  }
}