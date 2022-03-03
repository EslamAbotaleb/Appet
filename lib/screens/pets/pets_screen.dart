import 'package:appet/models/pets.dart';
import 'package:flutter/material.dart';

import 'card_pets_widget.dart';
import 'header_add_pet_widget.dart';

class PetsWidget extends StatefulWidget {
  PetsWidget({Key? key}) : super(key: key);

  @override
  _PetsWidgetState createState() => _PetsWidgetState();
}

class _PetsWidgetState extends State<PetsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          //Header
            AddPetWidget(),
          //List
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: new CardPetsWidget(pets[index]),
              );
            }),
          )
        ],
      ),
    );
  }
}