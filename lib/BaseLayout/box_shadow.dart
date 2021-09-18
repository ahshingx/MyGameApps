import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxShadowContainer extends StatelessWidget {
  final Widget widget;
  final double boxWidth, boxHeight;
  final EdgeInsetsGeometry margin;
  const BoxShadowContainer({key, this.widget, this.boxWidth, this.boxHeight, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: boxHeight,
      width: boxWidth,
      child: widget,
      decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
    );
  }

}