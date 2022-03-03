import 'package:appet/helpers/app_localizations.dart';
import 'package:appet/helpers/color_utils.dart';
import 'package:appet/screens/clinic/clinic_widget.dart';
import 'package:appet/screens/pets/pets_screen.dart';
import 'package:appet/screens/pets/questions/comment_screen.dart';
import 'package:appet/widgets/common.dart';
import 'package:appet/widgets/content_chip_builder_tab_bar_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as accuracy;

class ContentBottomBarWidget extends StatefulWidget {
  ContentBottomBarWidget({Key? key}) : super(key: key);

  @override
  _ContentBottomBarWidgetState createState() => _ContentBottomBarWidgetState();
}

class _ContentBottomBarWidgetState extends State<ContentBottomBarWidget> {
  Position? _currentPosition;
  String? _currentAddress;
  int selectedPage = 0;
// final Geolocator? geolocator = Geolocator()..forceAndroidLocationManager;

  final Geolocator? geolocator = Geolocator();

  final _pageOptions = [
    ClinicWidget(),
  //  PetsWidget(),
  CommentsPage(),
    Container(width: 150, height: 150, color: Colors.grey),
    Container(width: 150, height: 150, color: Colors.blue),
  ];
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtils.appColor,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.translate('appet')),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        elevation: 20,
        top: -30.0,
        backgroundColor: Colors.white,
        height: 90,
        curveSize: 85,
        chipBuilder: ChipTabBarBuilder(),
        style: TabStyle.custom,
        items: [
          TabItem(
            icon: Container(),
          ),
          TabItem(icon: Container()),
          TabItem(icon: Container()),
          TabItem(icon: Container()),
        ],
        initialActiveIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  _getCurrentLocation() async {
    Geolocator?.getCurrentPosition(
            desiredAccuracy: accuracy.LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      // logger.d(_currentPosition?.altitude);
    }).catchError((e) {
      print(e);
    });
  }

// _getAddressFromLatLng() async {
//   try {
//     List<Placemark> p = await geolocator?.placemarkFromCoordinates(
//         _currentPosition.latitude, _currentPosition.longitude);
//     Placemark place = p[0];
//     setState(() {
//       _currentAddress =
//       "${place.locality}, ${place.postalCode}, ${place.country}";
//     });
//   } catch (e) {
//     print(e);
//   }
// }

}
