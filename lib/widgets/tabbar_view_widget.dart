import 'package:appet/helpers/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../text_style_widget.dart';
import 'common.dart';

Widget switchBetweenTabBarSections(BuildContext context,
    List<String> contentName, List<Icon>? icons, bool isScrollable) {
  return Container(
    decoration: BoxDecoration(
      color:  Color(0xFFd8eff3),
      borderRadius: BorderRadius.circular(
        0.0,
      ),
    ),
    child: SizedBox(
      height: 60,
      child: TabBar(
          labelPadding: EdgeInsets.only(
              left: !isArabicLang(context) ? 15 : 10,
              right: !isArabicLang(context) ? 15 : 10),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
            color:  ColorUtils.appColor,
          ),
          labelColor: Colors.white,
          isScrollable: isScrollable,
          unselectedLabelColor: ColorUtils.headerTextDarkGrayColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(0.0),
          labelStyle: TextStyleWidget.build(isArabicLang(context),
              fontSize: 12, fontWeight: FontWeight.w300),
          // indicatorColor: Colors.blue,
          tabs: getTabs(contentName, icons, context)),
    ),
  );
}

List<Widget> getTabs(
    List<String> contentName, List<Icon>? icons, BuildContext context) {
  List<Widget> tabs = [];
  contentName.asMap().forEach(
        (index, value) => tabs.add(
          icons != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    icons[index],
                    SizedBox(
                      width: 8,
                    ),
                    getText(context, value),
                  ],
                )
              : getText(context, value),
        ),
      );
  return tabs;
}

Widget contentRowTabBar(BuildContext context, String contentName,
    {Icon? icon}) {
  return icon?.icon != null
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon?.icon),
            // SizedBox(
            //   width: 8,
            // ),
            getText(context, contentName),
          ],
        )
      : getText(context, contentName);
}

getText(BuildContext context, String name) => Tab(
      text: name,
    );
