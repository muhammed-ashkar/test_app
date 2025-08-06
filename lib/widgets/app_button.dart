import 'package:collage_testapp/styles/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  final Function? ontap;
  const AppButton({super.key, required this.screenHeight, required this.screenWidth,required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(ontap!= null){
          ontap!();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.07,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            width: screenWidth * 0.9 - 5,
            height: screenHeight * 0.07 - 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [AppColors.darkBlue, AppColors.lightBlue],
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
