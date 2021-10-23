import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  addNeumorphism( {
    double borderRadius = 10.0,
    double spreadRadius = 3.0,
    Offset offset = const Offset(5, 5),
    double blurRadius = 10,
    Color topShadowColor = Colors.white60,
    Color bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
            spreadRadius: spreadRadius,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: this,
    );
  }
}
