import 'dart:async';

import 'package:appet/helpers/color_utils.dart';
import 'package:appet/screens/authentication/veritfcation/pincode/submit_verify_pincode_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../text_style_widget.dart';

class FormPinCodeWidget extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;

  FormPinCodeWidget({
    Key? key,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  _FormPinCodeWidgetState createState() => _FormPinCodeWidgetState();
}

class _FormPinCodeWidgetState extends State<FormPinCodeWidget> {
  var onTapRecognizer;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }


  bool hasError = false;
  String currentText = "";
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController()
    ..text = "123456";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                // obsecureText: false,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 3) {
                    return "";
                  } else {
                    return null;
                  }
                },
                textStyle: TextStyleWidget.build(false, color: Colors.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor:
                      hasError ? ColorUtils.appColor : Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )),
        ),
        VerifyPinCodeWidget(
            phoneNumberController: textEditingController,
            formKey: formKey,
            hasError: hasError,
            errorController: errorController,
            currentText: currentText,
            scaffoldKey: widget.scaffoldKey)
      ],
    );
  }
}
