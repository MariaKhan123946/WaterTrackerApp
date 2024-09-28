import 'package:flutter/material.dart';
import 'package:watertracerapp/color/Appcolor.dart';

class SetYourGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 310,
                    left: 0,
                    child: Image.asset(
                      'images/img_19.png',
                      width: 150,
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        'images/img_20.png',
                        width: 300,
                        height: 150,
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BackButtonWithTitle(),
                      SizedBox(height: 16),
                      UnitSelectorWidget(),
                      SizedBox(height: 45),
                      WaterGoalSection(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Back Button and Title Widget
class BackButtonWithTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff3FBDF1)),
            onPressed: () => Navigator.pop(context),
          ),
          Spacer(),
          Text(
            'Set Your Goal',
            style: AppTextStyles.titleText,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}

// Unit Selector Widget
class UnitSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTextStyles.blueContainerColor,
              ),
              child: Text(
                '8',
                style: AppTextStyles.blueContainerTextStyle,
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: AppColors.blackColor,
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unit: Number of glass',
                style: AppTextStyles.unitTextStyle,
              ),
              Icon(Icons.arrow_drop_down, color: AppColors.blackColor),
            ],
          ),
        ),
      ],
    );
  }
}

// Water Goal Section Widget
class WaterGoalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 3,
            color: Color(0xff62CDFA),
          ),
          SizedBox(height: 8),
          Text('Water Goal', style: AppTextStyles.titleTextStyle),
          SizedBox(height: 8),
          Text('We prepared a lot of goals for you!',
              style: AppTextStyles.subtitleTextStyle),
          SizedBox(height: 20),
          SearchTemplateWidget(),
          SizedBox(height: 20),
          GoalCardsGrid(),
          SizedBox(height: 10),
          Container(
            height: 4,
            width: 150,
            color: AppColors.dotColor,
          ),
        ],
      ),
    );
  }
}

// Search Template Widget
class SearchTemplateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.searchColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('images/img_38.png', height: 20),
          SizedBox(width: 8),
          Text('Search Template', style: AppTextStyles.subtitleTextStyle),
        ],
      ),
    );
  }
}

// Grid of Goal Cards
class GoalCardsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
        children: [
          GoalContainer(title: 'Summer time', subtitle: '10 Glass', emoji: '🌴'),
          GoalContainer(title: 'Sporty', subtitle: '7 Glass', emoji: '🏀'),
          GoalContainer(title: 'Snow day', subtitle: '5 Glass', emoji: '❄️'),
          GoalContainer(title: 'Child', subtitle: '4 Glass', emoji: '🌈'),
        ],
      ),
    );
  }
}

// Reusable Goal Container Widget
class GoalContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;

  const GoalContainer({
    required this.title,
    required this.subtitle,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.greyColor),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.subtitleTextStyle),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(width: 10),
              Text(
                emoji,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
