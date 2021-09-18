import 'package:flutter/cupertino.dart';

class BaseTextStyle extends StatelessWidget {
  final String input;
  final Color color;
  final double fontSize;
  final double letterSpacing;
  final String fontFamily;

  BaseTextStyle({key, this.input, this.color, this.fontSize,
    this.letterSpacing, this.fontFamily}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      input,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
      ),
    );
  }

}