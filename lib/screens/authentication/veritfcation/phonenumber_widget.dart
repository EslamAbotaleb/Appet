import 'package:appet/helpers/color_utils.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class PhoneWidget extends StatefulWidget {
  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  String? _selectedCountryCode;
  List<String>? _countryCodes = ['+91', '+23'];

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      height: 30.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes?.map((String? value) {
              return  DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value!,
                    style: TextStyle(fontSize: 12.0),
                  ));
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedCountryCode = value;
              });
            },
          ),
        ),
      ),
    );
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: ColorUtils.appColor, width: 1),
            boxShadow: [
              BoxShadow(
                  color: ColorUtils.appColor,
                  blurRadius: 10,
                  offset: Offset(1, 1)),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: TextFieldWidget(
          TextEditingController(),
          prefixIcon: countryDropDown,
          hint: 'Phone Number',
          colorText: Colors.black,
          textInputType: TextInputType.number,
          validation: (_) {},
        ));
  }
}
