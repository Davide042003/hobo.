import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import '../constants.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:hobo_test/widgets/dark_theme_provider.dart';
import 'package:hobo_test/widgets/dark_theme_styles.dart';

class InputFieldPassword extends StatefulWidget {
  final bool show;
  final VoidCallback callback;
  final Function onChanged;
  final bool isRegistration;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const InputFieldPassword(
      this.show, this.callback, this.onChanged, this.isRegistration, this.focusNode, this.nextFocusNode);

  @override
  _InputFieldPasswordState createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    final TextStyle focusText = TextStyle(
        fontFamily: Constants.POPPINS,
        fontWeight: FontWeight.bold,
        height: -1,
        color: widget.isRegistration
            ? Color.fromRGBO(36, 65, 187, 1)
            : Color.fromRGBO(116, 142, 243, 1),
        fontSize: 15);

    final TextStyle regularText = TextStyle(
        fontFamily: Constants.POPPINS,
        color: Styles.loginregister_subheadingandform(
            themeChange.darkTheme, context),
        fontSize: 17);

    return Focus(
        onFocusChange: (hasFocus) {
          setState(() => _textStyle = hasFocus ? focusText : regularText);
        },
        child: Theme(
          data: new ThemeData(
            primaryColor: widget.isRegistration
                ? Color.fromRGBO(36, 65, 187, 1)
                : Color.fromRGBO(116, 142, 243, 1),
            hintColor: Styles.loginregister_subheadingandform(
                themeChange.darkTheme, context),
          ),
          child: TextFormField(
            focusNode: widget.focusNode,
            autocorrect: false,
            enableSuggestions: false,
            obscureText: !widget.show,
            decoration: InputDecoration(
              prefixIcon: Icon(Ionicons.key_outline),
              suffixIcon: IconButton(
                icon: Icon(
                    widget.show
                        ? Ionicons.eye_off_outline
                        : Ionicons.eye_outline,
                    color: Color.fromRGBO(193, 193, 193, 1)),
                onPressed: widget.callback,
              ),
              labelText: "Password",
              labelStyle: _textStyle,
              focusColor: widget.isRegistration
                  ? Color.fromRGBO(36, 65, 187, 1)
                  : Color.fromRGBO(116, 142, 243, 1),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.isRegistration
                          ? Color.fromRGBO(36, 65, 187, 1)
                          : Color.fromRGBO(116, 142, 243, 1),
                      width: 2)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Styles.loginregister_subheadingandform(
                          themeChange.darkTheme, context),
                      width: 1)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Styles.loginregister_subheadingandform(
                          themeChange.darkTheme, context),
                      width: 1)),
              errorStyle: TextStyle(
                  fontFamily: Constants.POPPINS,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(88, 88, 88, 1),
                  fontSize: 10),
            ),
            style: TextStyle(fontFamily: Constants.POPPINS, fontSize: 17,color: Styles.whiteblack(themeChange.darkTheme, context)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validatePassword,
            onChanged: widget.onChanged,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term){
                widget.focusNode.unfocus();
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
          ),
        ));
  }

  String _validatePassword(String value) {
    Pattern pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }
}
