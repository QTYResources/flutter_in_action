import 'package:clip/MyClipper.dart';
import 'package:flutter/material.dart';

class CustomClipperRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("imgs/avatar.png", width: 60.0);
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom clipper"),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: ClipRect(
            clipper: MyClipper(), // 使用自定义的clipper
            child: avatar,
          ),
        ),
      ),
    );
  }

}