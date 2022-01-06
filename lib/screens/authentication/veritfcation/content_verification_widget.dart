import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/fade_animation.dart';
import 'package:appet/screens/authentication/veritfcation/phonenumber_widget.dart';
import 'package:appet/screens/authentication/veritfcation/pincode/submit_send_verification_code.dart';
import 'package:flutter/material.dart';

import '../../../text_style_widget.dart';

class ContentVerificationWidget extends StatefulWidget {
  ContentVerificationWidget({Key? key}) : super(key: key);

  @override
  _ContentVerificationWidgetState createState() => _ContentVerificationWidgetState();
}

class _ContentVerificationWidgetState extends State<ContentVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return    Expanded(
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
                        
                          SubmitSendPinCodeWidget(),
                        ),
                      ],
                    ),
                  )),
            );
  }
}