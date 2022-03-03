import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/preferences_manager.dart';
import 'package:appet/screens/authentication/authentication_screen.dart';
import 'package:appet/screens/authentication/veritfcation/vertification_code_screen.dart';
import 'package:appet/screens/home/content_bottombar.dart';
import 'package:appet/screens/profile/complete_profile_Screen.dart';
import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

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
     pushScreen(context, AuthenticationScreen()
    //  AuthenticationScreen()
     );
    });
  }
  @override
  Widget build(BuildContext context) {
    /// Normal Logo Splash screen
  
    return Scaffold(
      body: SplashScreenView(
      navigateRoute:AuthenticationScreen(),
      //  VertificationPinCodeScreen(),
      //  _openScreen(),
      duration: 3500,
      imageSize: 130,
      speed: 180,
      text: "A p p e t",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 50.0,
        color: Colors.white
      ),)
    );
  }
}
