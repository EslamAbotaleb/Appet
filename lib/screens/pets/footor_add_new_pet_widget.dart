import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/screens/pets/request_passport_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

class FootorAddNewPetsTabWidget extends StatefulWidget {
  FootorAddNewPetsTabWidget({Key? key}) : super(key: key);

  @override
  _FootorAddNewPetsTabWidgetState createState() =>
      _FootorAddNewPetsTabWidgetState();
}

class _FootorAddNewPetsTabWidgetState extends State<FootorAddNewPetsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: ButtonTheme(
              height: 50,
              child: TextButtonWidget(
                color: Colors.white,
                text: AppLocalizations.of(context)!.translate('question'),
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
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: ButtonTheme(
              height: 50,
              child: TextButtonWidget(
                color: Colors.white,
                text:
                    AppLocalizations.of(context)!.translate('requestpassport'),
                onPressed: () {
                  openScreen(context, RequestPassportWidget(type: 'pets'));
                },
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
    );
  }
}
