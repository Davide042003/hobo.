import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:hobo_test/models/map_model.dart';

import 'map_widget.dart';

class SearchBarMapWidget extends StatefulWidget {
  final FocusNode focusNode;
  final Completer<GoogleMapController> _controller;
  final TextEditingController controller;

  const SearchBarMapWidget(this.focusNode, this._controller, this.controller);

  @override
  _SearchBarMapWidgetState createState() => _SearchBarMapWidgetState();
}

class _SearchBarMapWidgetState extends State<SearchBarMapWidget> {
  bool isAutocompleteEnabled = false;
  List<MapCity> _placeList = [];
  String _sessionToken;
  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Stack(
      children: [
        Stack(
          children: [
            isAutocompleteEnabled ? Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      color: Styles.home_navigatorbackground(
                          themeChange.darkTheme, context),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.07),
                            blurRadius: 21,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.035),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: _placeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minLeadingWidth: SizeConfig.screenWidth*0.01,
                          dense: true,
                          leading: CircleAvatar(
                            backgroundColor: Color.fromRGBO(116, 142, 243, 1),
                            radius: SizeConfig.screenWidth * 0.04,
                            child: Icon(
                              CustomIcons.pinlocationicon,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          title: Text(_placeList[index].mainText,style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 14, fontWeight: FontWeight.w500, color: Styles.whiteblack(themeChange.darkTheme, context)),),
                          subtitle: Text(_placeList[index].secondaryText != null
                              ? _placeList[index].secondaryText : "", style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12, fontWeight: FontWeight.w100, color: Color.fromRGBO(158, 158, 158, 1)),),

                          onTap: () {
                            setState(() {
                              getPlaceLoc(_placeList[index].id);
                              widget.controller.text = _placeList[index].mainText;
                              _placeList.clear();
                              widget.focusNode.unfocus();
                              isAutocompleteEnabled = false;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ) : SizedBox(),
            Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.065,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(40)),
                    color: Styles.home_navigatorbackground(
                        themeChange.darkTheme, context),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.07),
                          blurRadius: 21,
                          offset: Offset(0, 10))
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.07,
                      right: SizeConfig.screenWidth * 0.07,
                      top: SizeConfig.screenHeight * 0.005),
                  child: TextField(
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 16,
                          color: Styles.searchBar_text(
                              themeChange.darkTheme, context)),
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Search places",
                        hintStyle: TextStyle(
                            fontFamily: Constants.POPPINS,
                            fontSize: 16,
                            color: Styles.searchBar_text(
                                themeChange.darkTheme, context)),
                      ),
                      onTap: () {
                        setState(() {
                          widget.controller.text = "";
                          _placeList.clear();
                          isAutocompleteEnabled = false;
                        });
                      },
                      onChanged: (value) {
                        _onChanged(value);
                      }),
                )),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.005),
              height: SizeConfig.screenHeight * 0.055,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(116, 142, 243, 1),
                      Color.fromRGBO(36, 65, 187, 1)
                    ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(63, 83, 216, .23),
                      blurRadius: 4,
                      offset: Offset(0, 6))
                ],
              ),
              child: TextButton(
                onPressed: () {
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 2.0,
                        offset: Offset(0, 1)),
                  ]),
                  child:
                      Icon(CustomIcons.search, color: Colors.white, size: 26),
                ),
              )),
        ])
      ],
    );
  }

  _onChanged(String value) {
    if (value.isNotEmpty) {
      if (_sessionToken == null) {
        setState(() {
          _sessionToken = uuid.v4();
        });
      }
      getSuggestion(value);
    } else {
      setState(() {
        _placeList.clear();
        isAutocompleteEnabled = false;
      });
    }
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyAP9Tw6rUqoICKt6TLPhDGyRHtmeJFqobs";
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        Iterable list = json.decode(response.body)['predictions'];
        _placeList = list.map((e) => MapCity.fromJson(e)).toList();
        isAutocompleteEnabled =true;
      });

    } else {
      throw Exception('Failed to load predictions');
    }
  }

  void getPlaceLoc(String input) async {
    String kPLACES_API_KEY = "AIzaSyAP9Tw6rUqoICKt6TLPhDGyRHtmeJFqobs";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/details/json';
    String request =
        '$baseURL?place_id=$input&key=$kPLACES_API_KEY&fields=geometry';
    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        double lat = json.decode(response.body)["result"]['geometry']['location']['lat'];
        double lng = json.decode(response.body)["result"]['geometry']['location']['lng'];

        animateTo(lat, lng);
      });

    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await widget._controller.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);

    await c.animateCamera(CameraUpdate.newCameraPosition(p));
  }
}
