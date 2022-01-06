import 'dart:ui';

import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';

import '../text_style_widget.dart';


class InputDecorationWidget {
  // bool showPassword = true;
  InputDecoration build({
    String hint = '',
    String imageName = '',
    Widget? prefixIcon,

  }) {
    return InputDecoration(
    contentPadding: const EdgeInsets.all(12.0),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorUtils.appColor, width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xfff44336), width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xfff44336), width: 0.0),
        borderRadius: BorderRadius.circular(10),
      ),
      alignLabelWithHint: true,
      hintText: hint,
      hintStyle: TextStyleWidget.build(true,
          color: Color(0xff8d8d8d),
          fontWeight: FontWeight.w500,
          fontSize: 15.0),
      prefixIcon: prefixIcon,
      
    );
  }
}
