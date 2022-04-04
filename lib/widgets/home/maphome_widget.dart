import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/pagecontrol_provider.dart';

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
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _initialPosition,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final page = Provider.of<PageControlProvider>(context);

    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: _initialPosition != null ? Listener(
        onPointerDown: (e){
         page.changePage = 1;
        },
        child: GoogleMap(
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
        ),
      ) : CupertinoActivityIndicator(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
