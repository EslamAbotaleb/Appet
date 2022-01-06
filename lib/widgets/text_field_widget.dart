import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';

import '../text_style_widget.dart';
import 'common.dart';
import 'input_decoration_widget.dart';


class TextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final String? title;
  final String? hint;
  final String? Function(String?)? validation;
  final bool? isPassword;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool? statusRead;
  final String? imageName;
  final bool? enable;
   final Widget? prefixIcon;
   final Color? colorText;


  TextFieldWidget(
    this.textEditingController, {
    this.title,
    this.textInputType = TextInputType.text,
    this.validation,
    this.isPassword = false,
    this.onChanged,
    this.hint = '',
    this.maxLines = 1,
    this.statusRead = false,
    this.imageName = '',
    this.enable,
    this.prefixIcon,
    this.colorText
  });
  FocusNode input = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      title != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  title!,
                  style: TextStyleWidget.build(
                    isArabicLang(context),
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  textAlign:
                      isArabicLang(context) ? TextAlign.right : TextAlign.left,
                ),
              ),
            )
          : Container(),
      title != null
          ? SizedBox(
              height: 6,
            )
          : Container(),
      Container(
        padding: EdgeInsets.all(4),
        child: TextFormField(
            enabled: enable,
            focusNode: input,
            readOnly: statusRead!,
            maxLines: this.maxLines,
            controller: textEditingController,
            obscureText: isPassword!,
            keyboardType: textInputType,
            onChanged: onChanged,
            validator:  validation ,
            style: TextStyleWidget.build(
              isArabicLang(context),
              color: colorText
            ),
            cursorColor: ColorUtils.appColor,
            textAlign: isArabicLang(context) ? TextAlign.right : TextAlign.left,
            decoration: InputDecorationWidget().build(
              hint: hint!,
              imageName: imageName!,
              prefixIcon: prefixIcon
            ),
            ),
      ),
    ]);
  }
}
