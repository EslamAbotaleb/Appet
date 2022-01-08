import 'package:appet/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'change_state_widget.dart';

class HeaderDetectCurrentLocationAndChangeState extends StatefulWidget {
  HeaderDetectCurrentLocationAndChangeState({Key? key}) : super(key: key);

  @override
  _HeaderDetectCurrentLocationAndChangeStateState createState() =>
      _HeaderDetectCurrentLocationAndChangeStateState();
}

class _HeaderDetectCurrentLocationAndChangeStateState
    extends State<HeaderDetectCurrentLocationAndChangeState> {
  final Geolocator geolocator = Geolocator();

  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.location_on),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Location',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      if (_currentPosition != null && _currentAddress != null)
                        Text(_currentAddress ?? '',
                            style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            PopupChangeStateWidget(),
          ],
        ));
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
    _getCurrentLocation();

    return await Geolocator.getCurrentPosition();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getGeolocationAddress(position);
    }).catchError((e) {
      logger.d(e);
    });
  }

  Future<String> _getGeolocationAddress(Position position) async {
    // geocoding
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      setState(() {
        _currentAddress =
            "${place.street}, ${place.subAdministrativeArea}, ${place.thoroughfare}, ${place.administrativeArea}, ${place.country}";
      });
      return "${place.thoroughfare}, ${place.locality}";
    }

    return "No address available";
  }

}
