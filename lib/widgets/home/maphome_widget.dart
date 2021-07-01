import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MapHomeWidget extends StatefulWidget {
  @override
  _MapHomeWidgetState createState() => _MapHomeWidgetState();
}

class _MapHomeWidgetState extends State<MapHomeWidget>
    with AutomaticKeepAliveClientMixin {

  static LatLng _initialPosition;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _getUserLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print(_initialPosition);
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _initialPosition,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: _initialPosition != null ? GoogleMap(
        rotateGesturesEnabled: false,
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        padding: EdgeInsets.only(
            bottom: SizeConfig.screenHeight * 0.015,
            left: SizeConfig.screenWidth * 0.05),
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
             _controller.complete(controller);
          });
        },
      ) : CupertinoActivityIndicator(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
