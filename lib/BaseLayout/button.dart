import 'package:my_game_apps/BaseLayout/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_game_apps/BaseLayout/text_style.dart';

abstract class ButtonPressedDelegate {
  onButtonPressed(int buttonid);
}

class ButtonPressed extends StatefulWidget {
  final BaseTextStyle baseTextStyle;
  final ButtonPressedDelegate buttonPressedDelegate;
  final int buttonId;

  const ButtonPressed({key, this.baseTextStyle, this.buttonPressedDelegate,
    this.buttonId}) : super(key: key);

  @override
  _ButtonPressedState createState() => _ButtonPressedState();
}

class _ButtonPressedState extends State<ButtonPressed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.0,
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.red,
          onPressed: _onRaisedButtonPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: widget.baseTextStyle,
        ),
      ),
    );
  }

  void _onRaisedButtonPressed() {
    setState(() {
      widget.buttonPressedDelegate.onButtonPressed(widget.buttonId);
    });
  }
}