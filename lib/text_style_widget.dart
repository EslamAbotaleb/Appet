import 'package:flutter/material.dart';

class TextStyleWidget {
  static TextStyle build(
    bool isArabic, {
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 14,
    fontStyle: FontStyle.normal,
    Color? color = const Color(0xffffffff),
    TextDecoration? decoration,
  }) {
    return TextStyle(
        color: color,
        fontWeight: _getFontWeight(isArabic, fontWeight),
        fontStyle: fontStyle,
        fontSize: fontSize,
        height: 2,
        decoration: decoration);
  }

  static FontWeight _getFontWeight(bool isArabic, FontWeight fontWeight) {
    if (isArabic) return fontWeight;
    switch (fontWeight) {
      case FontWeight.w300:
        return FontWeight.w500;
      case FontWeight.w500:
        return FontWeight.w700;
    }
    return fontWeight;
  }
}
