import 'package:collage_testapp/styles/colors.dart';
import 'package:collage_testapp/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlue, AppColors.lightBlue],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: screenHeight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(screenHeight: screenHeight, screenWidth: screenWidth,text: 'MBBS / MD / DO / DM/MCh',),
                  AppButton(screenHeight: screenHeight, screenWidth: screenWidth,text: 'BSc / MSc / PhD',),
                  AppButton(screenHeight: screenHeight, screenWidth: screenWidth,text: 'Alternative Medicine',),
                  AppButton(screenHeight: screenHeight, screenWidth: screenWidth,text: 'Nurse / PA',),
                  AppButton(screenHeight: screenHeight, screenWidth: screenWidth,text: 'Administrator /MBA',),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
