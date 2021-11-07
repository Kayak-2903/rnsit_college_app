import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rnsit_college_app/values/theme.dart';

class Loading extends StatefulWidget {
  Widget? loadingSymbol;
  Color? backgroundColor;
  String? logoImage;
  Loading({Key? key, this.loadingSymbol, this.backgroundColor, this.logoImage})
      : super(key: key);
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    Widget? loadingSymbol = widget.loadingSymbol == null
        ? SpinKitCircle(
            color: Colors.white,
          )
        : widget.loadingSymbol;
    Color? backgroundColor =
        widget.backgroundColor == null ? kThemeColor : widget.backgroundColor;
    String? logoImage = widget.logoImage;
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: loadingSymbol);
  }
}
