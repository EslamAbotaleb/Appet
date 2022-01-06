

import 'package:appet/screens/authentication/veritfcation/pincode/pincode_screen.dart';
import 'package:flutter/material.dart';

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
      body: PinCodeScreen(),
    );
  }
}
