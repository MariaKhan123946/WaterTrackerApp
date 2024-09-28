import 'package:flutter/material.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.lightBlue, // Color for selected items
      unselectedItemColor: Colors.grey,    // Color for unselected items
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'images/Home.png',
            height: 20,
            color: currentIndex == 0 ? Colors.lightBlue : Colors.grey, // Change icon color based on selection
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'images/Analysis.png',
            height: 20,
            color: currentIndex == 1 ? Colors.lightBlue : Colors.grey,
          ),
          label: 'Analysis',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 50, // Width of the circular container
            height: 50, // Height of the circular container
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make it circular
              color: AppColors.white, // White background
            ),
            child: Center(
              child: Image.asset(
                'images/alarm.png',
                height: 20,
                color: currentIndex == 2 ? Colors.lightBlue : Colors.grey,
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'images/Setting.png',
            height: 20,
            color: currentIndex == 3 ? Colors.lightBlue : Colors.grey,
          ),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'images/profile.png',
            height: 20,
            color: currentIndex == 4 ? Colors.lightBlue : Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
