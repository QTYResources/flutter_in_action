import 'package:flutter/material.dart';

class DragVerticalRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => DragVerticalRouteState();

}

class DragVerticalRouteState extends State<DragVerticalRoute> {

  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖曳"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              // 垂直方向拖动事件
              onVerticalDragUpdate: (details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }

}