import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/styles/size_config.dart';
import 'package:hobo_test/widgets/styles/constants.dart';

class ProfileImageHomeWidget extends StatefulWidget {
  final AssetImage image;
  final String initials;

  ProfileImageHomeWidget({@required this.image, @required this.initials});

  @override
  _ProfileImageHomeWidgetState createState() => _ProfileImageHomeWidgetState();
}

class _ProfileImageHomeWidgetState extends State<ProfileImageHomeWidget> {

  bool _imgSuccess = false;

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    ImageStreamListener listener = ImageStreamListener(_setImage, onError: _setError);

    widget.image.resolve(ImageConfiguration()).addListener(listener);
  }

  void _setImage(ImageInfo image, bool sync) {
    setState(() => _imgSuccess = true);
  }

  void _setError(dynamic dyn, StackTrace st) {
    setState(() => _imgSuccess = false);
    dispose();
  }

  Widget _fallBackAvatar() {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: Center(child: Text(widget.initials, style: TextStyle(fontFamily: Constants.POPPINS)))
    );
  }


  Widget _avatarImage() {
    return CircleAvatar(
        backgroundImage: widget.image,
        backgroundColor: Colors.grey,
      radius: 25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _imgSuccess ? _avatarImage() : _fallBackAvatar(),
    );
  }
}