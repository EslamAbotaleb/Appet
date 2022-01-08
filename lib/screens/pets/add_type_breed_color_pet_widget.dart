import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddTypeAndBreedAndColor extends StatefulWidget {
  AddTypeAndBreedAndColor({Key? key}) : super(key: key);

  @override
  _AddTypeAndBreedAndColorState createState() =>
      _AddTypeAndBreedAndColorState();
}

class _AddTypeAndBreedAndColorState extends State<AddTypeAndBreedAndColor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20.0),
            child: TextFieldWidget(
              TextEditingController(),
              hint: AppLocalizations.of(context)!.translate('type'),
            ),
            decoration: InputBoxDecoration(),
          ),
        ),
     
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
            child: TextFieldWidget(
              TextEditingController(),
              hint: AppLocalizations.of(context)!.translate('breed'),
            ),
            decoration: InputBoxDecoration(),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
            child: TextFieldWidget(
              TextEditingController(),
              hint: AppLocalizations.of(context)!.translate('color'),
            ),
            decoration: InputBoxDecoration(),
          ),
        ),
      ],
    );
  }
}
