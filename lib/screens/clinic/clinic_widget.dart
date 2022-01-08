import 'package:appet/models/clinics.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'card_clinic_list_widget.dart';
import 'header_clinic_places_widget.dart';

class ClinicWidget extends StatefulWidget {
  ClinicWidget({Key? key}) : super(key: key);

  @override
  _ClinicWidgetState createState() => _ClinicWidgetState();
}

class _ClinicWidgetState extends State<ClinicWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          //Header
            HeaderDetectCurrentLocationAndChangeState(),
          //List
          Expanded(
            child: ListView.builder(
              itemCount: clinics.length,
              itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: new CardClinicWidget(clinics[index]),
              );
            }),
          )
        ],
      ),
    );
  }

 
}