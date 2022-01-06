import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/fade_animation.dart';
import 'package:flutter/material.dart';

import '../content_verification_widget.dart';



class PinCodeScreen extends StatefulWidget {
  PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              ColorUtils.appColor,
              Colors.deepPurpleAccent,
            ])),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: FadeAnimation(
                  2,
                  Text(
                    AppLocalizations.of(context)!.translate('appet'),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                )),
            
            ContentVerificationWidget()
          ],
        ),
      ),
    );
  }
}
