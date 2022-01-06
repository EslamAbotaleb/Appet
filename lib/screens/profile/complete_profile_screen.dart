import 'dart:io';

import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/widgets/circle_image_widget.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/scaffold_Widget.dart';
import 'package:appet/widgets/scroll_view_widget.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CompleteProfileScreen extends StatefulWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage(BuildContext context) async {
    if (!(await _isPermissionsGranted())) {
      showToast('Access Camera', false);
      return;
    }

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
    } else {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      ScrollViewWidget(
          child: Flexible(
      
        child: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: TextFieldWidget(
                TextEditingController(),
                hint: AppLocalizations.of(context)!.translate('firstname'),
              ),
              decoration: InputBoxDecoration(),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              child: TextFieldWidget(
                TextEditingController(),
                hint: AppLocalizations.of(context)!.translate('lastname'),
              ),
              decoration: InputBoxDecoration(),
            ),
            SizedBox(
              height: 25.0,
            ),
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
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 90,
                    // backgroundColor: Color(0xff476cfb),
                    child: ClipOval(
                      child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image != null)
                              ? Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                )
                              : CircleImageWidget(url: '')),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      size: 30.0,
                    ),
                    onPressed: () {
                      getImage(context);
                    },
                  ),
                ),
              ],
            ),
            getGenderWidget(false, false),

           Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          child: ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () {
              
              },
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.translate('register'),
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
        )
       
      )),
      icon: 'iconBack',
    );
  }

  Future<bool> _isPermissionsGranted() async {
    final Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      // Permission.microphone,
    ].request();

    return statuses.values.where((element) => element.isDenied).isEmpty;
  }

  Widget getGenderWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,

        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle:
            TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender? gender) {
          print(gender?.index);
        },
        //Alignment between icons
        equallyAligned: true,

        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }
}
