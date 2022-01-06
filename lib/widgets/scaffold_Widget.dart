import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final String icon;
  final bool showAppBar;
  final Function()? onPressed;
  final Widget? bottomNavgationBar;

  ScaffoldWidget(this.child,
      {this.title = '',
      this.icon = '',
      this.showAppBar = true,
      this.onPressed,
      this.bottomNavgationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: bottomNavgationBar,
        appBar: showAppBar
            ? AppBarWidget(context,
                    title: title, icon: icon, onPressed: onPressed)
                .build()
            : null,
        backgroundColor:  Colors.white,
        body: child);
  }
}
