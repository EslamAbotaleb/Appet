
import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/screens/pets/header_add_new_pet_widget.dart';
import 'package:appet/screens/pets/switch_married_pet_widget.dart';
import 'package:appet/widgets/scaffold_Widget.dart';
import 'package:appet/widgets/scroll_view_widget.dart';
import 'package:flutter/material.dart';

import 'add_type_breed_color_pet_widget.dart';
import 'footor_add_new_pet_widget.dart';


class AddNewPetWidget extends StatefulWidget {
  AddNewPetWidget({Key? key}) : super(key: key);

  @override
  _AddNewPetWidgetState createState() => _AddNewPetWidgetState();
}

class _AddNewPetWidgetState extends State<AddNewPetWidget> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ScrollViewWidget(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //setion header (upload image, name , tag)
            HeaderAddNewPetWidget(),
            AddTypeAndBreedAndColor(),
            SwitchPetMarriedorNotWidget(),
            FootorAddNewPetsTabWidget()
            
          ],
        )),
      ),
      title: AppLocalizations.of(context)!.translate('newpet'),
      icon: 'iconBack',
    );
  }

 
}
