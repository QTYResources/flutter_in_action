import 'package:flutter/material.dart';

class BothDirectionTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BothDirectionTestRouteState();

}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {

  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势冲突"),
      ),
//      body: Stack(
//        children: <Widget>[
//          Positioned(
//            left: _left,
//            child: GestureDetector(
//              child: CircleAvatar(child: Text("A")),  // 要拖动和点击的widget
//              onHorizontalDragUpdate: (details) {
//                setState(() {
//                  _left += details.delta.dx;
//                });
//              },
//              onHorizontalDragEnd:  (details) {
//                print("onHorizontalDragEnd");
//              },
//              onTapDown: (details) {
//                print("down");
//              },
//              onTapUp: (details) {
//                print("up");
//              },
//            ),
//          ),
//        ],
//      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 80.0,
            left: _left,
            child: Listener(
              onPointerDown: (details) {
                print("down");
              },
              onPointerUp: (details) {
                // 会触发
                print("up");
              },
              child: GestureDetector(
                child: CircleAvatar(child: Text("B")),
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print("onHorizontalDragEnd");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}