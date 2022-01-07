import 'dart:async';

import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/screens/profile/complete_profile_Screen.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/text_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinCodeWidget extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;
  GlobalKey<FormState>? formKey;
  String? currentText;
  bool? hasError;
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController? phoneNumberController;
  VerifyPinCodeWidget(
      {Key? key,
      this.scaffoldKey,
      this.formKey,
      this.currentText,
      this.hasError,
      this.phoneNumberController,
      this.errorController})
      : super(key: key);

  @override
  _VerifyPinCodeWidgetState createState() => _VerifyPinCodeWidgetState();
}

class _VerifyPinCodeWidgetState extends State<VerifyPinCodeWidget> {
  var onTapRecognizer;

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    widget.errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.phoneNumberController?.text.isEmpty == true
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  widget.hasError ?? false
                      ? AppLocalizations.of(context)!.translate('fillproperly')
                      : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            : Container(),
        SizedBox(
          height: 20,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: AppLocalizations.of(context)!.translate('notreceivepin'),
              style: TextStyle(color: Colors.black54, fontSize: 15),
              children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.translate('resend'),
                    recognizer: onTapRecognizer,
                    style: TextStyle(
                        color: ColorUtils.appColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ]),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          child: ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () {
                widget.formKey?.currentState?.validate();
                // conditions for validating
                if (widget.currentText?.length != 6 ||
                    widget.currentText != '123456') {
                  widget.errorController?.add(ErrorAnimationType
                      .shake); // Triggering error shake animation
                  setState(() {
                    widget.hasError = true;
                  });
                } else {
                  setState(() {
                    widget.hasError = false;
                    widget.scaffoldKey?.currentState!.showSnackBar(SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.translate('verify')),
                      duration: Duration(seconds: 2),
                    ));

                    widget.phoneNumberController?.clear();
                  });
                }
              },
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.translate('verify'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          decoration: BoxDecoration(
              color: ColorUtils.appColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: ColorUtils.appColor,
                    offset: Offset(1, -2),
                    blurRadius: 5),
                BoxShadow(
                    color: ColorUtils.appColor,
                    offset: Offset(-1, 2),
                    blurRadius: 5)
              ]),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButtonWidget(
              text: AppLocalizations.of(context)!.translate('Clear'),
              onPressed: () {
                widget.phoneNumberController?.clear();
              },
            ),
            TextButtonWidget(
              text: AppLocalizations.of(context)!.translate('AddPinCode'),
              onPressed: () {
                openScreen(context, CompleteProfileScreen());
                setState(() {
                  widget.phoneNumberController?.text = "123456";
                });
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.phoneNumberController?.clear();
  }
}
