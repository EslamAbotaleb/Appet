import 'package:appet/models/pets.dart';
import 'package:appet/widgets/circle_image_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';
import 'details_pets_widget.dart';

class CardPetsWidget extends StatelessWidget {
  final Pets pets;

  CardPetsWidget(this.pets);

  @override
  Widget build(BuildContext context) {
    final petsThumbnail = new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        alignment: FractionalOffset.centerLeft,
        child: CircleImageWidget(url: pets.image ?? ''));

    final baseTextStyle = const TextStyle();
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 14.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    final petsCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(55.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(pets.name ?? '', style: headerTextStyle),
          new Container(height: 5.0),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Text(pets.tag ?? '', style: subHeaderTextStyle),
          new Container(height: 5.0),
          new Text(pets.type ?? '', style: subHeaderTextStyle),
        ],
      ),
    );

    final petsCard = Container(
      child: petsCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 20.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF5763fa),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return InkWell(
      onTap: () {
        openScreen(context, DetailsPetWidget());
      },
      child: new Container(
          height: 120.0,
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              petsCard,
              petsThumbnail,
            ],
          )),
    );
  }
}
