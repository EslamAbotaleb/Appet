import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';

import '../text_style_widget.dart';
import 'common.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final ButtonStyle? buttonStyle;

  const TextButtonWidget(
      {required this.text,
      required this.onPressed,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 13,
      this.color = const Color(0xff34a8be),
      this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text,
          style: TextStyleWidget.build(
            isArabicLang(context),
            fontWeight: fontWeight,
            color: color == Colors.white ? Colors.white : ColorUtils.appColor,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center),
      style: buttonStyle ??
          TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            textStyle: TextStyle(
              color: color,
            ),
          ),
      onPressed: onPressed,

      // color: color,
      // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      // shape: RoundedRectangleBorder(
      //   side: BorderSide(
      //       width: 0,
      //       color: Color(color == Colors.white ? 0xffc6c6c6 : 0xff3a856d),
      //       style: BorderStyle.none),
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
    );
  }
}
