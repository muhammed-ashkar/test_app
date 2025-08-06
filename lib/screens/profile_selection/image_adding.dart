import 'dart:async';
import 'dart:io';
import 'package:collage_testapp/providers/image_selector_provider.dart';
import 'package:collage_testapp/screens/profile_selection/age_confirmation_screen.dart';
import 'package:collage_testapp/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageAddingScreen extends StatefulWidget {
  const ImageAddingScreen({super.key});

  @override
  State<ImageAddingScreen> createState() => _ImageAddingScreenState();
}

class _ImageAddingScreenState extends State<ImageAddingScreen> {
  Timer? timer;
  @override
  void dispose() {
    if(timer != null){
      timer?.cancel();
      timer = null;
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final ovalWidth = screenWidth * 0.6; // 60% of screen width
    final ovalHeight = screenHeight * 0.5; // 40% of screen height
    final borderSize = 5.0;

    

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.blue, AppColors.darkBlue],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: ()async{
                  final ImagePicker picker = ImagePicker();
                  XFile? image = await picker.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.front);
                  if(image != null){
                    context.read<ImageSelectorProvider>().setImagePath(image.path);
                    timer = Timer(Duration(seconds: 3), (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> ProfileAddingScreen(imagePath: image.path,)));
                    });
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer oval (border)
                    ClipOval(
                      child: Container(
                        width: ovalWidth + borderSize * 2,
                        height: ovalHeight + borderSize * 2,
                        color: AppColors.gold,
                      ),
                    ),
                    // Inner oval (content)
                    ClipOval(
                      child: context.watch<ImageSelectorProvider>().imagePath.isEmpty ? Container(
                        width: ovalWidth,
                        height: ovalHeight,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'Selfie',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ) : SizedBox(width: ovalWidth, height: ovalHeight, child: Image.file(File(context.watch<ImageSelectorProvider>().imagePath))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Click on the selfie to add an image',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
