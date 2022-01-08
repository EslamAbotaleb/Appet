import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';

import '../../text_style_widget.dart';

class SwitchPetMarriedorNotWidget extends StatefulWidget {
  SwitchPetMarriedorNotWidget({Key? key}) : super(key: key);

  @override
  _SwitchPetMarriedorNotWidgetState createState() =>
      _SwitchPetMarriedorNotWidgetState();
}

class _SwitchPetMarriedorNotWidgetState
    extends State<SwitchPetMarriedorNotWidget> {
  bool isSwitched = false;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Switch(
              value: isSwitched,
              onChanged: checkVisible,
              activeTrackColor: ColorUtils.appColor,
              activeColor: ColorUtils.appColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.translate('married'),
                style: TextStyleWidget.build(false,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          )
        ],
      ),
    );
  }

  void checkVisible(bool value) {
    setState(() {
      _isVisible = !_isVisible;
    });
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}
