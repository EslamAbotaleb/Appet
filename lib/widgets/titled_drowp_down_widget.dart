import 'package:flutter/material.dart';
import '../text_style_widget.dart';
import 'common.dart';
import 'drop_down_title.dart';

class TitledDropDownWidget extends StatefulWidget {
  final String? title;
  final List<DropDownItem> items;
  final Function(DropDownItem) onChange;
  DropDownItem? selectedValue;
  TextStyle? titleTextStyle;
  double? spaceHeight;
  String hint;

  TitledDropDownWidget(
      {this.title,
      required this.items,
      required this.onChange,
      required this.hint,
      this.selectedValue,
      this.spaceHeight = 10.0,
      this.titleTextStyle});

  @override
  _TitledDropDownWidgetState createState() => _TitledDropDownWidgetState();
}

class _TitledDropDownWidgetState extends State<TitledDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    bool isLangArabic = isArabicLang(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.spaceHeight,
        ),
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.title ?? "",
                style: widget.titleTextStyle ??
                    TextStyleWidget.build(false, color: Colors.black),
                textAlign:
                    isArabicLang(context) ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
        const SizedBox(
          height: 6,
        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xffD4D4EA))),
            child: dropdownButton(
                isLangArabic, widget.hint, widget.items, widget.onChange)),
      ],
    );
  }

  dropdownButton(bool isLangArabic, String hint, List<DropDownItem> items,
          Function(DropDownItem) onChange) =>
      DropdownButton<DropDownItem>(
        value: widget.selectedValue,
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        iconSize: 24,
        isExpanded: true,
        hint: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            hint,
            style: TextStyleWidget.build(false,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            textAlign: isArabicLang(context) ? TextAlign.right : TextAlign.left,
          ),
        ),
        underline: Container(),
        style: TextStyleWidget.build(false, color: Colors.black),
        onChanged: (value) {
          if (value != null) {
            onChange(value);
            setState(() {
              widget.selectedValue = value;
            });
          }
        },
        items: items
            .map((value) => DropdownMenuItem<DropDownItem>(
                  value: value,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      value.getDropDownItemText(isLangArabic),
                      style: TextStyleWidget.build(false, color: Colors.black),
                      textAlign: isArabicLang(context)
                          ? TextAlign.right
                          : TextAlign.left,
                    ),
                  ),
                ))
            .toList(),
      );
}
