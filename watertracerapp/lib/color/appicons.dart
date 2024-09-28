import 'package:flutter/material.dart';

class AppIcons {
  static const double iconSize = 250.0;

  // Widget for waterDrop icon
  static Widget waterDrop() {
    return Image.asset(
      'images/Bottle of water-bro 1.png', // Corrected path to your icon image
      width: AppIcons.iconSize,
      height: AppIcons.iconSize,
      fit: BoxFit.contain,
    );
  }

  // Widget for WorldDrop icon
  static Widget worldDrop() {
    return Image.asset(
      'images/World water day-bro 1.png', // Corrected path to your icon image
      width: AppIcons.iconSize,
      height: AppIcons.iconSize,
      fit: BoxFit.contain,
    );
  }

  // Widget for BottleDrop icon
  static Widget bottleDrop() {
    return Image.asset(
      'images/Bottle of water-rafiki 1.png',
      // Corrected path to your icon image
      width: AppIcons.iconSize,
      height: AppIcons.iconSize,
      fit: BoxFit.contain,
    );
  }

  // Widget for Drop icon
  // static Widget drop() {
  //   return Image.asset(
  //     'assets/images/icon.png', // Corrected path to your icon image
  //     width: AppIcons.iconSize,
  //     height: AppIcons.iconSize,
  //     fit: BoxFit.contain,
  //   );
  // }

  static Widget WaterDropIcon() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Image.asset(
        'images/icon.png', // Corrected path to your icon image
        width: AppIcons.iconSize,
        height: AppIcons.iconSize,
        fit: BoxFit.contain,
      ),
    );
  }
}
