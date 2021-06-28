import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';


class ProfileImageChatWidget extends StatefulWidget {
  final AssetImage image;
  final String initials;

  ProfileImageChatWidget({@required this.image, @required this.initials});

  @override
  _ProfileImageChatWidgetState createState() => _ProfileImageChatWidgetState();
}

class _ProfileImageChatWidgetState extends State<ProfileImageChatWidget> {

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
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: SizeConfig.screenHeight * 0.027,
        child: Center(child: Text(widget.initials, style: TextStyle(fontFamily: Constants.POPPINS, color: Colors.black, fontSize: 15)))
    );
  }


  Widget _avatarImage() {
    return CircleAvatar(
      backgroundImage: widget.image,
      backgroundColor: Colors.grey,
      radius: SizeConfig.screenHeight * 0.027,
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