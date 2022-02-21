import 'package:appet/helpers/color_utils.dart';
import 'package:appet/text_style_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/login_button_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
          
            Color.fromRGBO(100, 114, 255, 1.0),
            Color.fromRGBO(100, 114, 255, 1.0),
          ])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35),
              child: Text(
                'A p p e t',
                style: TextStyleWidget.build(false,
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'By tapping Create Account or Sign In, you agree to our\n',
                      style: kNormalText,
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: kUnderlinedText,
                    ),
                    TextSpan(
                      text: '. Learn how we process your data in our ',
                      style: kNormalText,
                    ),
                    TextSpan(
                      text: 'Privacy\nPolicy',
                      style: kUnderlinedText,
                    ),
                    TextSpan(
                      text: ' and ',
                      style: kNormalText,
                    ),
                    TextSpan(
                      text: 'Cookies Policy',
                      style: kUnderlinedText,
                    ),
                    TextSpan(
                      text: '.',
                      style: kNormalText,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white),
              child: TextButton(
                child: Text("CREATE ACCOUNT"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            
            StyleButtonWidget(
              text: 'SIGN IN',
            ),
          ],
        ),
      ),
    ));
  }
}
