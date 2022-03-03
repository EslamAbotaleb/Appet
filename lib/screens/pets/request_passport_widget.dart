import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/models/clinics.dart';
import 'package:appet/widgets/scaffold_Widget.dart';
import 'package:appet/widgets/text_button_widget.dart';
import 'package:appet/widgets/titled_drowp_down_widget.dart';
import 'package:flutter/material.dart';

import '../../text_style_widget.dart';

class RequestPassportWidget extends StatefulWidget {
  String? type;
  RequestPassportWidget({Key? key, this.type}) : super(key: key);

  @override
  _RequestPassportWidgetState createState() =>
      _RequestPassportWidgetState();
}

class _RequestPassportWidgetState extends State<RequestPassportWidget> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                SizedBox(height: 25.0,),

            TitledDropDownWidget(
              items: clinics,
              onChange: (_) {},
              hint: 'Select Clinic',
              titleTextStyle: TextStyleWidget.build(
                false,
                color: ColorUtils.appColor,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
            ),
    SizedBox(height: 25.0,),
               Container(
            width: 150,
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: ButtonTheme(
              height: 50,
              child: TextButtonWidget(
                color: Colors.white,
                text: AppLocalizations.of(context)!.translate('submit'),
                onPressed: () {},
              ),
            ),
            decoration: BoxDecoration(
                color: ColorUtils.appColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: ColorUtils.appColor,
                      offset: Offset(1, 1),
                      blurRadius: 2),
                ]),
          ),

          ],
        ),
      ),
      title: 'Request passport pets',
      icon: 'iconBack',
    );
  }
}
