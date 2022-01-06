import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';

import 'insert_pincode.dart';

class SubmitSendPinCodeWidget extends StatefulWidget {
  String? phoneNumber;
  SubmitSendPinCodeWidget({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _SubmitSendPinCodeWidgetState createState() =>
      _SubmitSendPinCodeWidgetState();
}

class _SubmitSendPinCodeWidgetState extends State<SubmitSendPinCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pushScreen(context, PinCodeVerificationScreen("+8801376221100"));
      },
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.purpleAccent,
          shadowColor: Colors.purpleAccent,
          elevation: 18,
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.purpleAccent, Colors.deepPurpleAccent]),
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
    );
  }
}
