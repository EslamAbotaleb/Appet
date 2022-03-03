import 'package:appet/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';

import '../text_style_widget.dart';

ProgressDialog progressDialogWidget(BuildContext context,
    {String message = "Loading..."}) {
  final ProgressDialog progressBar =
      ProgressDialog(context, isDismissible: true);
  progressBar.style(
    message: message,
    textAlign: TextAlign.start,
    messageTextStyle: TextStyleWidget.build(
      false,
      color: Colors.black,
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
    ),
  );

  return progressBar;
}
