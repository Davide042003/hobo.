import 'package:flutter/material.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';


class ProfileImageWidget extends StatefulWidget {
  final AssetImage image;
  final String initials;

  ProfileImageWidget({@required this.image, @required this.initials});

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {

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
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.16),
                blurRadius: 12,
                offset: Offset(0,5)
            )
          ]
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: SizeConfig.screenHeight * 0.065,
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: SizeConfig.screenHeight * 0.061,
            child: Center(child: Text(widget.initials, style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 25, color: Colors.black)))
        ),
      ),
    );
  }


  Widget _avatarImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            blurRadius: 12,
            offset: Offset(0,5)
          )
        ]
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: SizeConfig.screenHeight * 0.065,
        child: CircleAvatar(
          backgroundImage: widget.image,
          backgroundColor: Colors.grey,
          radius: SizeConfig.screenHeight * 0.061,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: _imgSuccess ? _avatarImage() : _fallBackAvatar(),
        ),
        Padding(
          padding:EdgeInsets.only(left: SizeConfig.screenWidth*0.245,top: SizeConfig.screenHeight* 0.049),
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(211, 243, 225, 1),
            radius: SizeConfig.screenHeight * 0.014,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(55, 199, 117, 1),
              radius: SizeConfig.screenHeight * 0.01,
              child: Center(child: Icon(LineIcons.check, color: Colors.white,size: 12,)),
            ),
          ),
        ),
      ],
    );
  }
}