import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';
import 'package:http/http.dart' as http;
import 'package:hobo_test/widgets/home/marker_generator.dart';
import 'package:flutter/rendering.dart';

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
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation();

    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);

    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final city = cities[i];
      markersList.add(Marker(
          markerId: MarkerId(city.name),
          position: city.position,
          icon: BitmapDescriptor.fromBytes(bmp),
          onTap: () {
            animateTo(city.position.latitude, city.position.longitude);
            _customInfoWindowController.addInfoWindow(
                Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Styles.map_tour(themeChange.darkTheme, context),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: 36,
                                  offset: Offset(0,20)
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "I am here",
                                style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.29),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      blurRadius: 36,
                                      offset: Offset(0,20)
                                  )
                                ]
                            ),
                            child: Transform.rotate(
                                angle: 180 * pi / 180,child: Icon(CupertinoIcons.triangle_fill,size: 22,color: Styles.map_tour(themeChange.darkTheme, context),)),
                          ),
                        ),
                      ),
                    ],
                ),city.position
            );
      }));
    });
    return markersList;
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

  Future<void> animateTo(double lat, double lng) async {
    final c = await widget._controller.future;
    final p = CameraPosition(target: LatLng(lat + 1.1, lng ), zoom: 8);

    await c.animateCamera(CameraUpdate.newCameraPosition(p));
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
            : Stack(children: [
          Stack(
            children: [
              Listener(
                onPointerDown: (e) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  setState(() {
                    enableRelocate = true;
                  });
                  _customInfoWindowController.hideInfoWindow();
                },
                child: GoogleMap(
                  onTap: (value){
                    _customInfoWindowController.hideInfoWindow();
                  },
                  onCameraMove: (value){
                    _customInfoWindowController.onCameraMove();
                  },
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight * 0.07,
                        left: SizeConfig.screenWidth * 0.05),
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(target: LatLng(45.811328, 15.975862), zoom: 8),
                    onMapCreated: (GoogleMapController controller) async {
                      setState(() {
                        widget._controller.complete(controller);
                        _customInfoWindowController.googleMapController = controller;
                      });
                    },
                    markers:  markers.toSet(),
                ),
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: SizeConfig.screenHeight * 0.27,
                width: SizeConfig.screenWidth * 0.9,
                offset: SizeConfig.screenHeight * 0.08,
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
                  : SizedBox(),
            ],
          ),
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}

Widget _getMarkerWidget(String name) {
  return Container(
    margin: EdgeInsets.all(SizeConfig.screenWidth * 0.008),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.36),
          offset: Offset(0,3),
          blurRadius: 6,
        )
      ],
    ),
    child: CircleAvatar(
      radius: SizeConfig.screenWidth * 0.08,
      backgroundColor: Color.fromRGBO(116, 142, 243, 1),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.008),
        child: ProfileImageWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
      ),
    ),
  );
}

// Example of backing data
List<City> cities = [
  City("Zagreb", LatLng(45.792565, 15.995832)),
  City("Ljubljana", LatLng(46.037839, 14.513336)),
  City("Novo Mesto", LatLng(45.806132, 15.160768)),
  City("Varaždin", LatLng(46.302111, 16.338036)),
  City("Maribor", LatLng(46.546417, 15.642292)),
  City("Rijeka", LatLng(45.324289, 14.444480)),
  City("Karlovac", LatLng(45.489728, 15.551561)),
  City("Klagenfurt", LatLng(46.624124, 14.307974)),
  City("Graz", LatLng(47.060426, 15.442028)),
  City("Celje", LatLng(46.236738, 15.270346))
];

List<Widget> markerWidgets() {
  return cities.map((c) => _getMarkerWidget(c.name)).toList();
}

class City {
  final String name;
  final LatLng position;

  City(this.name, this.position);
}
