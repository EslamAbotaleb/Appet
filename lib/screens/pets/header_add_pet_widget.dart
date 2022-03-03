import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/text_style_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'insert_new_pet_widget.dart';

class AddPetWidget extends StatefulWidget {
  AddPetWidget({Key? key}) : super(key: key);

  @override
  _AddPetWidgetState createState() => _AddPetWidgetState();
}

class _AddPetWidgetState extends State<AddPetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: InkWell(
        onTap: () {
          openScreen(context, AddNewPetWidget());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, size: 23, color: ColorUtils.appColor,),
              ),
              Text(AppLocalizations.of(context)!.translate('addpets'), style: TextStyleWidget.build(false,fontWeight: FontWeight.bold, fontSize: 15, color: ColorUtils.appColor)),
            ],
          ),
        ),
      )
    );
  }
}