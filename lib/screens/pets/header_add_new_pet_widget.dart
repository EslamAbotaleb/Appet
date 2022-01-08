import 'package:appet/helpers/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appet/widgets/text_field_widget.dart';
import 'package:appet/widgets/circle_image_widget.dart';
import 'package:appet/widgets/common.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HeaderAddNewPetWidget extends StatefulWidget {
  HeaderAddNewPetWidget({Key? key}) : super(key: key);

  @override
  _HeaderAddNewPetWidgetState createState() => _HeaderAddNewPetWidgetState();
}

class _HeaderAddNewPetWidgetState extends State<HeaderAddNewPetWidget> {

    File? _image;
  final ImagePicker picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 45,
                        child: ClipOval(
                          child: new SizedBox(
                              width: 120.0,
                              height: 120.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image!,
                                      fit: BoxFit.fill,
                                    )
                                  : CircleImageWidget(url: '')),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 18.0,
                        ),
                        onPressed: () {
                          getImage(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          SizedBox(height: 15,),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(

                child: TextFieldWidget(
                  TextEditingController(),
                  hint: AppLocalizations.of(context)!.translate('name'),
                ),
                decoration: InputBoxDecoration(),
            ),
                     ),
              SizedBox(height: 15,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                  child: TextFieldWidget(
                    TextEditingController(),
                    hint: AppLocalizations.of(context)!.translate('tag'),
                  ),
                  decoration: InputBoxDecoration(),
            ),
               ),

                  ],
                ),
              ),
            ]);
  }


   Future getImage(BuildContext context) async {
    if (!(await isPermissionsGranted())) {
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
}