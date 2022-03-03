import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/helpers/fade_animation.dart';
import 'package:appet/screens/authentication/veritfcation/phonenumber_widget.dart';
import 'package:appet/text_style_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';

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
