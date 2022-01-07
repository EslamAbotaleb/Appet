import 'package:appet/helpers/app_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../text_style_widget.dart';
import 'common.dart';

class ChipTabBarBuilder extends ChipBuilder {
  String? titleTabBar;
  IconData? iconTabBar;

  ChipTabBarBuilder({this.titleTabBar, this.iconTabBar});

  @override
  Widget build(BuildContext context, Widget child, int index, bool active) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(bottom:  10 ),
                padding: EdgeInsets.only(left: 4, right: 4),
                child: index == 0
                    ? 
                    Padding(
                            // Color(0xfffafafa)
                            padding: EdgeInsets.only(
                                top: 3.0,
                                left: MediaQuery.of(context).size.width * 0.02,
                                right: MediaQuery.of(context).size.width * 0.02,
                                bottom: 0),
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(.20), // darker color
                                    ),
                                    BoxShadow(
                                      color: Colors.white, // background color
                                      spreadRadius: -1.0,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: columnDisplayIconAndTitleWidget(
                                    context,
                                    AppLocalizations.of(context)!
                                        .translate("clinic"),
                                    "assets/icons/iconclinic.png",
                                    active)),
                          )
                   
                    : index == 1
                        ? Padding(
                        padding: EdgeInsets.only(
                                top: 3.0,
                                left: MediaQuery.of(context).size.width * 0.02,
                                right: MediaQuery.of(context).size.width * 0.02,
                                bottom: 0),
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(.20), // darker color
                                    ),
                                    BoxShadow(
                                      color: Colors.white, // background color
                                      spreadRadius: -1.0,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                      child: columnDisplayIconAndTitleWidget(
                          context,
                          AppLocalizations.of(context)!.translate("pets"),
                          "assets/icons/iconpet.png",
                          active),)
                    )
                        : index == 2 ? 
                        Padding(
                           padding: EdgeInsets.only(
                                top: 3.0,
                                left: MediaQuery.of(context).size.width * 0.02,
                                right: MediaQuery.of(context).size.width * 0.02,
                                bottom: 0),
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(.20), // darker color
                                    ),
                                    BoxShadow(
                                      color: Colors.white, // background color
                                      spreadRadius: -1.0,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                          child: columnDisplayIconAndTitleWidget(
                              context,
                              AppLocalizations.of(context)!.translate("adoption"),
                              "assets/icons/iconadoption.png",
                              active),
                        ))
                            : Padding(
                              padding: EdgeInsets.only(
                                top: 3.0,
                                left: MediaQuery.of(context).size.width * 0.02,
                                right: MediaQuery.of(context).size.width * 0.02,
                                bottom: 0),
                            child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(.20), // darker color
                                    ),
                                    BoxShadow(
                                      color: Colors.white, // background color
                                      spreadRadius: -1.0,
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                              child: columnDisplayIconAndTitleWidget(
                              context,
                              AppLocalizations.of(context)!.translate("account"),
                              "assets/icons/iconaccount.png",
                              active)),
                            ))
                            ,
          ),
        )
      ],
    );
  }

  Column columnDisplayIconAndTitleWidget(
      BuildContext context, String title, String imageAssets, bool active) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width:active == true ? 20 : 20,
            height: active == true ? 20 : 20,
            child: Center(
              child: Image.asset(
                imageAssets,
                color: itemColor(active, context),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Center(
              child: Text(
            title,
            style: TextStyleWidget.build(
              isArabicLang(context),
              fontSize: active == true ? 12 :  10,
              fontWeight: FontWeight.w300,
              color: itemColor(active, context),
            ),
          )),
        )
      ],
    );
  }

  itemColor(bool isActive, BuildContext context) =>
      isActive == true ? Color(0xff34a8be) : Color(0xff7674A1);
}
