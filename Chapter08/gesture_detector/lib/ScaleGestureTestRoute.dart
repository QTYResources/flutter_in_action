import 'package:flutter/material.dart';

class ScaleGestureTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ScaleGestureTestRouteState();

}

class ScaleGestureTestRouteState extends State<ScaleGestureTestRoute> {

  double _width = 200.0;  // 通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale test"),
      ),
      body: Center(
        child: GestureDetector(
          // 指定宽度，高度自适应
          child: Image.asset(
            "images/sea.jpg",
            width: _width,
          ),
          onScaleUpdate: (details) {
            setState(() {
              // 缩放倍数在0.8到10之间
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }

}