import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class GalleryWidget extends StatefulWidget {
  final String userId;

  const GalleryWidget({Key key, @required this.userId}) : super(key: key);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CollectionReference posts = FirebaseFirestore.instance.collection('users')
        .doc(widget.userId)
        .collection('posts');

    return FutureBuilder<QuerySnapshot>(
      future: posts.get(),
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
          print('Posts');
          print(documents[0]['postId']);
          int countPosts = snapshot.data.docs.length;
          return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01, bottom: SizeConfig.screenHeight *.12),
              itemCount: countPosts,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: SizeConfig.screenWidth*0.005, mainAxisSpacing:SizeConfig.screenHeight*0.0023),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: SizeConfig.screenWidth * 0.28,
                  //    height: SizeConfig.screenWidth * 0.14,
                  child: Image.asset(
                    "assets/images/NewYork-Background.png",
                    fit: BoxFit.cover,
                  ),
                );
              });
        }

        return Text("loading");
      },
    );

  }
}
