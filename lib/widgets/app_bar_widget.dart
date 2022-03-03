import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/material.dart';
import '../text_style_widget.dart';
import 'common.dart';

class AppBarWidget {
  // static final iconBack = "iconback";
  final BuildContext context;
  final String title;
  final String icon;
  final Function()? onPressed;

  AppBarWidget(
    this.context, {
    this.title = '',
    this.icon = '',
    this.onPressed,
  });

  PreferredSize build() {
    final mediaQuery = MediaQuery.of(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(45),
      // here the desired height
      child: AppBar(
        backgroundColor:  Colors.white,
        centerTitle: true,
        title:  Text(
              title,
              style: TextStyleWidget.build(
                isArabicLang(context),
              color: ColorUtils.appColor,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
        elevation: 0,
        bottomOpacity: 0,
       
        leading: icon == 'iconBack'
            ? Padding(
              padding: const EdgeInsets.all(7.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color:Colors.black
                      ,
                ),
                onPressed: _previousScreen,
              ),
            )
            : Container(),
      ),
    );
  }

  _openSideMenu() {}

  _openNotifications() {}

  _previousScreen() {
  
    Navigator.of(context).pop();
  }
}
