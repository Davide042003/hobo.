import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MapWidget extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final TextEditingController _controllerText;

  const MapWidget(this._controller, this._controllerText);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>
    with AutomaticKeepAliveClientMixin {
  static LatLng _initialPosition;
  bool enableRelocate = false;

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

  Future<void> animateToInitial() async {
    Position position = await _determinePosition();

    final c = await widget._controller.future;
    final p = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14.4746);

    await c.animateCamera(CameraUpdate.newCameraPosition(p));

    setState(() {
      enableRelocate = false;
      widget._controllerText.text = "";
    });
  }

  void getPlaceLoc(String input) async {
    String kPLACES_API_KEY = "AIzaSyAP9Tw6rUqoICKt6TLPhDGyRHtmeJFqobs";
    String baseURL = 'https://maps.googleapis.com/maps/api/place/details/json';
    String request =
        '$baseURL?place_id=$input&key=$kPLACES_API_KEY&fields=geometry';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        double lat =
            json.decode(response.body)["result"]['geometry']['location']['lat'];
        double lng =
            json.decode(response.body)["result"]['geometry']['location']['lng'];

        _initialPosition = LatLng(lat, lng);
        print("past location");
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _initialPosition,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: _initialPosition == null
          ? CupertinoActivityIndicator()
          : Stack(
              children: [
                Stack(
                  children: [
                    Listener(
                      onPointerDown: (e){
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        setState(() {
                          enableRelocate = true;
                        });
                      },
                      child: GoogleMap(
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.screenHeight * 0.07,
                            left: SizeConfig.screenWidth * 0.05),
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          setState(() {
                            widget._controller.complete(controller);
                          });
                        },

                      ),
                    ),
                    enableRelocate
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.screenWidth * 0.07,
                                  bottom: SizeConfig.screenHeight * 0.13),
                              child: Container(
                                width: SizeConfig.screenWidth * 0.1,
                                height: SizeConfig.screenHeight * 0.05,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10)
                                    ]),
                                child: FloatingActionButton(
                                  elevation: 0,
                                  focusElevation: 0,
                                  hoverElevation: 0,
                                  highlightElevation: 0,
                                  disabledElevation: 0,
                                  onPressed: animateToInitial,
                                  backgroundColor: Styles.publishtour_bar(
                                      themeChange.darkTheme, context),
                                  child: Icon(
                                    Ionicons.locate,
                                    color: Styles.whiteblack(
                                        themeChange.darkTheme, context),
                                    size: 22,
                                  ),
                                ),
                              ),
                            ))
                        : SizedBox()
                  ],
                ),
              ],
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
