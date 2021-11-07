import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rnsit_college_app/values/theme.dart';

class HyperlinkText extends StatefulWidget {
  final String text;
  final bool clickable;
  final Widget goToWidget;
  const HyperlinkText(
    this.text,
    this.clickable,
    this.goToWidget, {
    Key? key,
  }) : super(key: key);

  @override
  _HyperlinkTextState createState() => _HyperlinkTextState();
}

class _HyperlinkTextState extends State<HyperlinkText> {
  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final bool clickable = widget.clickable;
    final Widget goToWidget = widget.goToWidget;
    return RichText(
        text: TextSpan(
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = clickable
                  ? () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => goToWidget));
                    }
                  : null,
            style: const TextStyle(
                color: kThemeColor, decoration: TextDecoration.underline)));
  }
}
