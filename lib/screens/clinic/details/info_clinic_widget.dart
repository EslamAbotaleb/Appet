import 'package:appet/helpers/color_utils.dart';
import 'package:appet/widgets/tabbar_view_widget.dart';
import 'package:flutter/material.dart';

class ClinicInfoWidget extends StatefulWidget {
  ClinicInfoWidget({Key? key}) : super(key: key);

  @override
  _ClinicInfoWidgetState createState() => _ClinicInfoWidgetState();
}

class _ClinicInfoWidgetState extends State<ClinicInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      Container(color: Colors.transparent, child: Center(child: Text('Book'))),
      Container(color: Colors.transparent, child: Center(child: Text('Request passport')),)
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Scaffold(
            body: TabBarView(children: _pageOptions),
            bottomNavigationBar: switchBetweenTabBarSections(
                context,
                ['Book', 'Request passport'],
                [
                  Icon(
                    Icons.book,
                    size: 18,
                  ),
                  Icon(
                    Icons.request_quote,
                    size: 18,
                  )
                ],
                false),
          ),
        ),
      ),
    );
  }
}
