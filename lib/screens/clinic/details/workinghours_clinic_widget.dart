import 'package:appet/widgets/circle_image_widget.dart';
import 'package:appet/widgets/scaffold_Widget.dart';
import 'package:flutter/material.dart';


class WorkingHourWidget extends StatefulWidget {
  WorkingHourWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WorkingHourWidgetState createState() => _WorkingHourWidgetState();
}

class _WorkingHourWidgetState extends State<WorkingHourWidget> {
  // selected's value = 0. For default first item is open.
  int selected = 0; //attention

  @override
  Widget build(BuildContext context) {
    return   Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              key: Key('builder ${selected.toString()}'), //attention
              padding: EdgeInsets.only(left: 13.0, right: 13.0, bottom: 25.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  Divider(
                    height: 17.0,
                    color: Colors.white,
                  ),
                  ExpansionTile(
                    key: Key(index.toString()), //attention
                    initiallyExpanded: index == selected, //attention

                    leading: CircleImageWidget(url: ''),
                    title: Text('Branch ${index}',
                        style: TextStyle(
                            color: Color(0xFF09216B),
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Branch name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          'Working hour  \n' + 'from 00 to 00',
                        ),
                      )
                    ],
                    onExpansionChanged: ((newState) {
                      if (newState)
                        setState(() {
                          Duration(seconds: 20000);
                          selected = index;
                        });
                      else
                        setState(() {
                          selected = -1;
                        });
                    }),
                  ),
                ]);
              },
            )
          ]),
        ),
      

      
    );
  }
}