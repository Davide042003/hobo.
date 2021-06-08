import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class CardTourProfileWidget extends StatefulWidget {
  final int index;

  CardTourProfileWidget({
    @required this.index,
  });

  @override
  _CardTourProfileWidgetState createState() => _CardTourProfileWidgetState();
}

class _CardTourProfileWidgetState extends State<CardTourProfileWidget> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: SizeConfig.screenWidth * 0.86,
      height: SizeConfig.screenHeight * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Styles.cardtour_map(themeChange.darkTheme, context),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.09),
              blurRadius: 14,
              offset: Offset(0, 3))
        ],
      ),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
        child: Row(children: [
          Container(
            width: SizeConfig.screenWidth * 0.17,
            height: SizeConfig.screenHeight * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Image.asset(
              cardTourArrayList[widget.index].placeImage,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * 0.015,
                left: SizeConfig.screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTourArrayList[widget.index].placeName,
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
                Flexible(
                  child: Row(children: [
                    RatingBarIndicator(
                      rating: cardTourArrayList[widget.index].rating,
                      itemBuilder: (context, index) => Icon(
                        LineIcons.starAlt,
                        color: Color.fromRGBO(55, 199, 117, 1),
                      ),
                      unratedColor: Colors.black.withOpacity(.28),
                      itemCount: 5,
                      itemSize: 14,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    Text(
                      cardTourArrayList[widget.index].rating.toString() + " (" + cardTourArrayList[widget.index].numberRatings.toString() + ")",
                      style: TextStyle(
                          fontFamily: Constants.POPPINS,
                          fontSize: 12,
                          color: Color.fromRGBO(184, 184, 184, 1),
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
                  ]),
                ),
                Text(
                  "\$" + cardTourArrayList[widget.index].price.toString(),
                  style: TextStyle(
                      fontFamily: Constants.POPPINS,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Styles.whiteblack(themeChange.darkTheme, context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.11,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
                width: SizeConfig.screenWidth * 0.1,
                height: SizeConfig.screenHeight * 0.05,
                child: liked == true
                    ? Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.05),
                    child: Icon(
                      LineIcons.heartAlt,
                      color: Color.fromRGBO(245, 95, 185, 1),
                    ))
                    : Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.05),
                    child: Icon(
                      LineIcons.heart,
                      color: Color.fromRGBO(210, 210, 210, 1),
                    ))),
            onTap: () {
              setState(() {
                if (!liked) {
                  liked = true;
                } else {
                  liked = false;
                }
                print(liked);
              });
            },
          )
        ]),
      ),
    );
  }
}
