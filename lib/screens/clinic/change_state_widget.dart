import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/widgets/text_button_widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class PopupChangeStateWidget extends StatefulWidget {
  @override
  _PopupChangeStateWidgetState createState() => _PopupChangeStateWidgetState();
}

class _PopupChangeStateWidgetState extends State<PopupChangeStateWidget> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButtonWidget(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: ColorUtils.appColor,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CSCPicker(
                              onCountryChanged: (value) {
                                setState(() {
                                  countryValue = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = value ?? '';
                                });
                              },
                              onCityChanged: (value) {
                                setState(() {
                                  cityValue = value ?? '';
                                });
                              },
                            ),
                            SizedBox(height: 15.0,),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 30),
                              child: ButtonTheme(
                                height: 50,
                                child: FlatButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                    }
                                  },
                                  child: Center(
                                      child: Text(
                                    AppLocalizations.of(context)!
                                        .translate('change'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: ColorUtils.appColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ColorUtils.appColor,
                                        offset: Offset(1, -2),
                                        blurRadius: 5),
                                    BoxShadow(
                                        color: ColorUtils.appColor,
                                        offset: Offset(-1, 2),
                                        blurRadius: 5)
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        text: "Change state",
      ),
    );
  }
}
