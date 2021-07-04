import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:flutter/rendering.dart';
import 'package:hobo_test/widgets/home/marker_generator.dart';

class MapWaypointsWidget extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final VoidCallback hasSelected;
  final VoidCallback hasDeleted;

  const MapWaypointsWidget(this._controller, this.hasSelected, this.hasDeleted);

  @override
  _MapWaypointsWidgetState createState() => _MapWaypointsWidgetState();
}

class _MapWaypointsWidgetState extends State<MapWaypointsWidget> {
  bool enableRelocate = false;
  List<Marker> markers = [];
  List<Marker> markersHighlight = [];
  int markerFlag = null;

  @override
  void initState() {
    super.initState();

    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);

    MarkerGenerator(markerWidgetsHighlight(), (bitmaps) {
      setState(() {
        markersHighlight = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }


  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final city = cities[i];
      markersList.add(Marker(
          markerId: MarkerId(i.toString()),
          position: city.position,
          icon: BitmapDescriptor.fromBytes(bmp),
          onTap: () {
            if (markerFlag != i) {
              if (markerFlag != null) {
                final marker = markers[markerFlag];

                Marker _markerInitial = marker.copyWith(
                    iconParam: BitmapDescriptor.fromBytes(bitmaps[markerFlag]));

                setState(() {
                  markers[markerFlag] = _markerInitial;
                });

                markerFlag = null;
              }

              final marker = markers[i];

              Marker _marker = marker.copyWith(
                  iconParam: markersHighlight[i].icon);
              markerFlag = i;

              setState(() {
                markers[i] = _marker;
              });

              widget.hasSelected();

            } else {
              final marker = markers[markerFlag];

              Marker _markerInitial = marker.copyWith(
                  iconParam: BitmapDescriptor.fromBytes(bitmaps[markerFlag]));

              setState(() {
                markers[markerFlag] = _markerInitial;
              });

              markerFlag = null;
              widget.hasDeleted();
            }
          }));
    });
    return markersList;
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await widget._controller.future;
    final p = CameraPosition(target: LatLng(lat + 1.1, lng), zoom: 8);

    await c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            Listener(
              onPointerDown: (e) {

                MarkerGenerator(markerWidgets(), (bitmaps) {
                  setState(() {
                    markers = mapBitmapsToMarkers(bitmaps);

                    if (markerFlag != null) {
                      final marker = markers[markerFlag];

                      Marker _markerInitial = marker.copyWith(
                          iconParam: BitmapDescriptor.fromBytes(bitmaps[markerFlag]));

                      setState(() {
                        markers[markerFlag] = _markerInitial;
                      });

                      markerFlag = null;
                      widget.hasDeleted();

                  }});
                }).generate(context);

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
                initialCameraPosition: CameraPosition(
                    target: LatLng(45.811328, 15.975862), zoom: 8),
                onMapCreated: (GoogleMapController controller) async {
                  setState(() {
                    widget._controller.complete(controller);
                  });
                },
                markers: markers.toSet(),
              ),
            ),
            enableRelocate
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.screenWidth * 0.07,
                          bottom: SizeConfig.screenHeight * 0.13),
                      child: AnimatedContainer(
                        transform: Matrix4.translationValues(
                            0,
                            markerFlag == null
                                ? SizeConfig.screenHeight * 0.00
                                : SizeConfig.screenHeight * -0.25,
                            0),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
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
                          onPressed: () {},
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
        ));
  }
}

class MarkerShape extends StatelessWidget {
  int index;

  MarkerShape(this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.screenWidth * 0.008),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.36),
                offset: Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          child: CircleAvatar(
            radius: SizeConfig.screenWidth * 0.08,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(116, 142, 243, 1),
                    Color.fromRGBO(52, 86, 210, 1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  border: Border.all(
                      color: Color.fromRGBO(36, 65, 187, 1),
                      width: SizeConfig.screenWidth * 0.0125)),
              child: Center(
               child: Text((index +1).toString(), style: TextStyle(
                  fontFamily: Constants.POPPINS, fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white
                ),)
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.068,
                left: SizeConfig.screenWidth * 0.06),
            child: Transform.rotate(
                angle: 180 * pi / 180,
                child: Icon(
                  CupertinoIcons.triangle_fill,
                  size: 22,
                  color: Color.fromRGBO(36, 65, 187, 1),
                ))),
        Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.069,
                left: SizeConfig.screenWidth * 0.07),
            child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(52, 86, 210, 1),
                        Color.fromRGBO(36, 65, 187, 1)
                      ],
                    ).createShader(bounds),
                child: Transform.rotate(
                    angle: 180 * pi / 180,
                    child: Icon(
                      CupertinoIcons.triangle_fill,
                      size: 14,
                      color: Colors.white,
                    )))),
      ],
    );
  }
}

class MarkerShapeHighlight extends StatelessWidget {
  int index;

  MarkerShapeHighlight(this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.screenWidth * 0.008),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.36),
                offset: Offset(0, 3),
                blurRadius: 6,
              )
            ],
          ),
          child: CircleAvatar(
            radius: SizeConfig.screenWidth * 0.12,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(245, 95, 185, 1),
                    Color.fromRGBO(246, 0, 153, 1),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  border: Border.all(
                      color: Color.fromRGBO(174, 25, 114, 1),
                      width: SizeConfig.screenWidth * 0.0125)),
              child: Center(
                  child: Text((index +1).toString(), style: TextStyle(
                      fontFamily: Constants.POPPINS, fontSize: 35, fontWeight: FontWeight.w600, color: Colors.white
                  ),)
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.105,
                left: SizeConfig.screenWidth * 0.09),
            child: Transform.rotate(
                angle: 180 * pi / 180,
                child: Icon(
                  CupertinoIcons.triangle_fill,
                  size: 29,
                  color: Color.fromRGBO(174, 25, 114, 1),
                ))),
        Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.105,
                left: SizeConfig.screenWidth * 0.1),
            child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(246, 0, 153, 1),
                    Color.fromRGBO(219, 16, 138, 1)
                  ],
                ).createShader(bounds),
                child: Transform.rotate(
                    angle: 180 * pi / 180,
                    child: Icon(
                      CupertinoIcons.triangle_fill,
                      size: 19,
                      color: Colors.white,
                    )))),
      ],
    );
  }
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

List<MarkerShape> markerWidgets() {
  return cities.map((c) => MarkerShape(cities.indexOf(c))).toList();
}

List<MarkerShapeHighlight> markerWidgetsHighlight() {
  return cities.map((c) => MarkerShapeHighlight(cities.indexOf(c))).toList();
}

class City {
  final String name;
  final LatLng position;

  City(this.name, this.position);
}
