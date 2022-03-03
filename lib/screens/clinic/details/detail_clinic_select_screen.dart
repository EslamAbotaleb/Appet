import 'package:appet/helpers/color_utils.dart';
import 'package:appet/screens/clinic/details/workinghours_clinic_widget.dart';
import 'package:appet/widgets/circle_image_widget.dart';
import 'package:appet/widgets/scaffold_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_toggle_tab/helper.dart';

import '../../../../text_style_widget.dart';
import 'info_clinic_widget.dart';

class DetailClinicWidget extends StatefulWidget {
  DetailClinicWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DetailClinicWidgetState createState() => _DetailClinicWidgetState();
}

class _DetailClinicWidgetState extends State<DetailClinicWidget> {
  var _tabTextIndexSelected = 1;
  var _tabTextIconIndexSelected = 0;
  var _tabIconIndexSelected = 0;
  var _tabSelectedIndexSelected = 0;

  var _listTextTabToggle = ["Info", "Working hours", "Rating"];
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
       SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(
              height: heightInPercent(3, context),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleImageWidget(url: '',),
                SizedBox(width: 25.0,),
                Text('Clinic name', style: TextStyleWidget.build(
                  false,
                  fontSize: 14,
                  color: ColorUtils.appColor,
                  fontWeight: FontWeight.bold

                ))
              ],
            ),
          ),
            SizedBox(
              height: heightInPercent(3, context),
            ),
            FlutterToggleTab(
              // width in percent
              width: 90,
              borderRadius: 30,
              height: 50,
              selectedIndex: _tabTextIndexSelected,
              selectedBackgroundColors: [Colors.blue, ColorUtils.appColor],
              selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              unSelectedTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              labels: _listTextTabToggle,
              selectedLabelIndex: (index) {
                setState(() {
                  _tabTextIndexSelected = index;
                });
              },
              isScroll: false,
            ),
          
            SizedBox(
              height: heightInPercent(3, context),
            ),
            _tabTextIndexSelected == 0 ? 
            ClinicInfoWidget()
            : _tabTextIndexSelected == 1 ? 
              WorkingHourWidget()
              :
                Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: Colors.blue,),
            // SizedBox(
            //   height: heightInPercent(3, context),
            // ),
            // Divider(
            //   thickness: 2,
            // ),

            /// Text with icon sample
            // SizedBox(
            //   height: heightInPercent(3, context),
            // ),
          


          
          ],
        ),
      ),
      icon: 'iconBack',
      title: 'ClinicName',
    );
  }
}