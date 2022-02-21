import 'package:appet/text_style_widget.dart';
import 'package:flutter/material.dart';

class StyleButtonWidget extends StatelessWidget {
  final String text;
  const StyleButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyleWidget.build(false, color: Colors.white,fontWeight: FontWeight.w500,),
         
        ),
      ),
    );
  }
}