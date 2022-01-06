import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/fade_animation.dart';
import 'package:appet/screens/authentication/veritfcation/phonenumber_widget.dart';
import 'package:appet/text_style_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import 'insert_pincode.dart';

class VertificationPinCodeScreen extends StatefulWidget {
  VertificationPinCodeScreen({Key? key}) : super(key: key);
  @override
  _VertificationPinCodeScreenState createState() =>
      _VertificationPinCodeScreenState();
}

class _VertificationPinCodeScreenState
    extends State<VertificationPinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              // Colors.purple,
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
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  margin: const EdgeInsets.only(top: 60),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            // color: Colors.red,
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 22, bottom: 20),
                            child: FadeAnimation(
                              2,
                              Text(
                                  AppLocalizations.of(context)!
                                      .translate('Login'),
                                  style: TextStyleWidget.build(false,
                                      color: ColorUtils.appColor,
                                      fontSize: 20)),
                            )),
                         FadeAnimation(
                          2,
                       Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: PhoneWidget(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        FadeAnimation(
                          2,
                          ElevatedButton(
                            onPressed: () {
                              pushScreen(context, PinCodeVerificationScreen(
          "+8801376221100"));
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.purpleAccent,
                                shadowColor: Colors.purpleAccent,
                                elevation: 18,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Colors.purpleAccent,
                                    Colors.deepPurpleAccent
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                width: 200,
                                height: 50,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Send',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
