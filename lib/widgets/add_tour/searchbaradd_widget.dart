import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/custom_icons/custom_bar_icons.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/provider/newtour_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:hobo_test/models/map_model.dart';

class SearchBarAddWidget extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final VoidCallback changePage;
  final int what;

  SearchBarAddWidget(this.focusNode, this.controller, this.changePage, this.what);

  @override
  _SearchBarAddWidgetState createState() => _SearchBarAddWidgetState();
}

class _SearchBarAddWidgetState extends State<SearchBarAddWidget> {
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
    final addNewTour = Provider.of<NewTourProvider>(context);

    return Stack(
      children: [
        Stack(
          children: [
            isAutocompleteEnabled
                ? Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight * 0.03),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.035),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          itemCount: _placeList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: SizeConfig.screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Styles.publishtour_backgroundinputfield(
                                    themeChange.darkTheme, context),
                              ),
                              child: ListTile(
                                minLeadingWidth: SizeConfig.screenWidth * 0.01,
                                dense: true,
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Color.fromRGBO(116, 142, 243, 1),
                                  radius: SizeConfig.screenWidth * 0.04,
                                  child: Icon(
                                    CustomIcons.pinlocationicon,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                                title: Text(
                                  _placeList[index].mainText,
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Styles.whiteblack(
                                          themeChange.darkTheme, context)),
                                ),
                                subtitle: Text(
                                  _placeList[index].secondaryText != null
                                      ? _placeList[index].secondaryText
                                      : "",
                                  style: TextStyle(
                                      fontFamily: Constants.POPPINS,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromRGBO(158, 158, 158, 1)),
                                ),
                                onTap: () {
                                  setState(() {
                         //           getPlaceLoc(_placeList[index].id);
                                    widget.controller.text =
                                        _placeList[index].mainText;

                                    widget.focusNode.unfocus();
                                    isAutocompleteEnabled = false;

                                    // save "index" in newtour_provider
                                    if(widget.what == 1) {
                                     addNewTour.setTourPlaceName = _placeList[index].mainText;
                                     addNewTour.setTourPlaceId = _placeList[index].id;
                                    }else if(widget.what==2) {
                                      addNewTour.setPlaceNameActivity =
                                          _placeList[index].mainText;
                                      addNewTour.setPlaceIdActivity =
                                          _placeList[index].id;
                                    }

                                    print(addNewTour.tourPlaceName + " " + addNewTour.tourPlaceId);

                                    _placeList.clear();
                                    //print("Tour place index: " + addNewTour.tourPlaceName);
                      /*              widget.placeId = _placeList[index].id;
                                    widget.placeName =
                                        _placeList[index].mainText;*/

                                    widget.changePage();
                                  });
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: SizeConfig.screenHeight * 0.01,);
                          }
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            Theme(
              data: new ThemeData(
                primaryColor: Color.fromRGBO(116, 142, 243, 1),
                hintColor: Styles.loginregister_subheadingandform(
                    themeChange.darkTheme, context),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Styles.publishtour_backgroundinputfield(
                      themeChange.darkTheme, context),
                ),
                child: TextFormField(
                  autofocus: true,
                  focusNode: widget.focusNode,
                  autocorrect: false,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.035),
                    hintText: "Search Place",
                    hintStyle: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontSize: 15,
                        color: Styles.publishtour_hintText(
                            themeChange.darkTheme, context)),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorStyle: TextStyle(
                        fontFamily: Constants.POPPINS,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(88, 88, 88, 1),
                        fontSize: 10),
                  ),
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 15,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    _onChanged(value);
                  },
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    setState(() {
                      widget.controller.text = "";
                      _placeList.clear();
                      isAutocompleteEnabled = false;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
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
        isAutocompleteEnabled = true;
      });
    } else {
      throw Exception('Failed to load predictions');
    }
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
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }
}
