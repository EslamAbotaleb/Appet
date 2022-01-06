import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/preferences_manager.dart';
import 'package:appet/screens/authentication/veritfcation/vertification_code_screen.dart';
import 'package:appet/screens/home/home_screen.dart';
import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

  }

  _openScreen() async {

    Future.delayed(const Duration(seconds: 1), () {
     pushScreen(context, VertificationPinCodeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    /// Normal Logo Splash screen
   
    return Scaffold(
  
      body: SplashScreenView(
      navigateRoute: VertificationPinCodeScreen(),
      //  _openScreen(),
      duration: 3500,
      imageSize: 130,
      speed: 180,
      text: "A p p e t",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 50.0,
        color: Colors.white
      ),
       backgroundColor: ColorUtils.appColor,
    ),
    );
  }
}