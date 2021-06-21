import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hobo_test/widgets/chat/profileimagechat_widget.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/profileimage_widget.dart';

class ReviewCardWidget extends StatefulWidget {
  final String userId;

  const ReviewCardWidget({Key key, this.userId}) : super(key: key);

  @override
  _ReviewCardWidgetState createState() => _ReviewCardWidgetState();
}

class _ReviewCardWidgetState extends State<ReviewCardWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);

    CollectionReference reviews = FirebaseFirestore.instance.collection('users')
        .doc(widget.userId)
        .collection('reviews');

    return FutureBuilder<QuerySnapshot>(
      future: reviews.get(),
      builder:
          (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data.docs.length == 0) {
          return Text("Document does not exist");
        }

        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data.docs;
          print('Success -> Review - reviewcard_widget');
          int countTour = snapshot.data.docs.length;
          //Map<String, dynamic> data = snapshot.data.docs as Map<String, dynamic>;

          return Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight*0.2,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth *0.065, vertical: SizeConfig.screenHeight * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ProfileImageChatWidget(image: AssetImage("assets/images/provaSocial.jpeg"), initials: "DB"),
                          SizedBox(width: SizeConfig.screenWidth*0.035),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jayden Smith",style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 15,fontWeight: FontWeight.w600, color: Styles.whiteblack(themeChange.darkTheme, context)),),
                              Text("2d",style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12,fontWeight: FontWeight.normal, color: Color.fromRGBO(186, 195, 230, 1)),),
                            ],
                          ),
                          Expanded(child: Padding(
                            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight *0.02),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) => Icon(
                                  LineIcons.starAlt,
                                  color: Color.fromRGBO(55, 199, 117, 1),
                                ),
                                unratedColor: Colors.black.withOpacity(.28),
                                itemCount: 5,
                                itemSize: 12,
                                direction: Axis.horizontal,
                                itemPadding: EdgeInsets.only(right: SizeConfig.screenWidth *0.007),
                              ),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight*0.01),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth *0.15),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.",style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 12,fontWeight: FontWeight.normal, color: Styles.profile_review(themeChange.darkTheme, context)),),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.screenHeight * 0.02),
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.001,
                        color: Styles.tourpreview_bar(
                            themeChange.darkTheme, context),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          );
        }
        return Text("loading");
      },
    );
  }
}
