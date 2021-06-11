import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';


class ProfileImageSocialWidget extends StatefulWidget {
  final AssetImage image;
  final String initials;

  ProfileImageSocialWidget({@required this.image, @required this.initials});

  @override
  _ProfileImageSocialWidgetState createState() => _ProfileImageSocialWidgetState();
}

class _ProfileImageSocialWidgetState extends State<ProfileImageSocialWidget> {

  bool _imgSuccess = false;

  @override
  initState() {
    super.initState();

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
        height: SizeConfig.screenWidth * 0.5,
        width:  SizeConfig.screenHeight * 0.025,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            color: Colors.grey,
        ),
        child: Center(child: Text(widget.initials, style: TextStyle(fontFamily: Constants.POPPINS)))
    );
  }


  Widget _avatarImage() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: SizeConfig.screenHeight * 0.0145,
      child: CircleAvatar(
        backgroundImage: widget.image,
        backgroundColor: Colors.white,
        radius: SizeConfig.screenHeight * 0.013,
      ),
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