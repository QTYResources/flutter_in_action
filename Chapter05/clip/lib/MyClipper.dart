import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
  
}