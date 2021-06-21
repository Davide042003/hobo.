import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/home/cardtour_template.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';
import 'package:hobo_test/widgets/profile/cardtourprofile_widget.dart';

class TourlistProfileWidget extends StatefulWidget {

  const TourlistProfileWidget({
    Key key,
    @required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  _TourlistProfileWidgetState createState() => _TourlistProfileWidgetState();
}

class _TourlistProfileWidgetState extends State<TourlistProfileWidget> {
  @override
  Widget build(BuildContext context) {
    CollectionReference tours = FirebaseFirestore.instance.collection('users')
        .doc(widget.userId)
        .collection('tours');

    return FutureBuilder<QuerySnapshot>(
      future: tours.get(),
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
          print('Success -> Tours - tourlistprofile_widget');
          int countTour = snapshot.data.docs.length;
          //Map<String, dynamic> data = snapshot.data.docs as Map<String, dynamic>;
          return Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01,
                    bottom: SizeConfig.screenHeight * 0.12),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: documents.length,
                itemBuilder: (ctx, i) => CardTourProfileWidget(index: i,
                  tourName: documents[i]["tourName"],
                  tourRatings: documents[i]["tourRatings"],
                  tourTotalRatings: documents[i]["tourTotalRatings"],
                  tourPrice: documents[i]["tourPrice"],
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: SizeConfig.screenHeight * 0.017),
              ));
        }
        return Text("loading");
      },
    );
  }
}