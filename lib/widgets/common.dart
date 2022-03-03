import 'dart:io';

import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
Logger logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
    methodCount: 1,
    errorMethodCount: 2,
    colors: false,
  ),
);
const kNormalText = TextStyle(
  fontSize: 12,
  color: Colors.white,
);
Future<bool> isPermissionsGranted() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      // Permission.microphone,
    ].request();

    return statuses.values.where((element) => element.isDenied).isEmpty;
  }

const kUnderlinedText = TextStyle(
  fontSize: 12,
  color: Colors.white,
  decoration: TextDecoration.underline,
  fontWeight: FontWeight.w500,
);
getLanguage(BuildContext context) {
  return Localizations?.localeOf(context).languageCode;
}

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}

DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}

bool isArabicLang(BuildContext context) => getLanguage(context) == "ar";

clearFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

showsnackBar(BuildContext context, String title) {
  final snackBar = SnackBar(
      content: Row(
    children: [
      CircularProgressIndicator(),
      SizedBox(
        width: 20.0,
      ),
      Text("Signing"),
    ],
  ));

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  return regex.hasMatch(value);
}


BoxDecoration InputBoxDecoration() {
  return   BoxDecoration(
                  border: Border.all(color: ColorUtils.appColor, width: 1),
                  boxShadow: [
                    BoxShadow(
                        color: ColorUtils.appColor,
                        blurRadius: 8,
                        offset: Offset(1, 1)),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)));
}
showToast(String message, bool isSuccess) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: isSuccess ? Color(0xff00aeb7) : Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

void openScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}

void pushScreen(BuildContext context, Widget screen) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen), (route) => false);
}

Future<T?> pushPage<T>(BuildContext? context, Widget? page) {
  return Navigator.of(context!)
      .push<T>(MaterialPageRoute(builder: (context) => page!));
}

Future<bool> isConnectedToNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com')
        .timeout(Duration(seconds: 30));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      logger.d('connected to network');
      return true;
    } else {
      logger.d('failure connected to network');
      return false;
    }
  } on SocketException catch (_) {}
  logger.w('not connected to the network');
  return false;
}

extension ColorExtension on Color {
  String get hexValue {
    return '#${this.value.toRadixString(16)}';
  }
}
