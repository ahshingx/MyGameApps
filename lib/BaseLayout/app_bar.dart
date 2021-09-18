import 'package:my_game_apps/BaseLayout/text_style.dart';
import 'package:my_game_apps/Tools/constant.dart';
import 'package:my_game_apps/Tools/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final Widget widget;
  const BaseAppBar({key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget,
      appBar: AppBar(
        title:  BaseTextStyle(
          input: Util.getTextFromJson(context, 'app_name').toUpperCase(),
          letterSpacing: 2.0,
          fontFamily: Constant.FONT_SF_PRO_MEDIUM,
          color: Colors.black,
          fontSize: 16.0,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Constant.Light_Silver,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10.0),
          icon: Image.asset("assets/ps5_logo.png", width: 100.0, height: 100.0,),
        ),
      ),
      backgroundColor: Constant.Light_Silver,
    );
  }
}