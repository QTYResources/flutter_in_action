import 'package:custom_animation/AnimatedDecoratedBox.dart';
import 'package:flutter/material.dart';

class AnimatedDecoratedBoxRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AnimatedDecoratedBoxRouteState();

}

class AnimatedDecoratedBoxRouteState extends State<AnimatedDecoratedBoxRoute> {

  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡"),
      ),
//      body: AnimatedDecoratedBox(
//        duration: Duration(milliseconds: 400),
//        decoration: BoxDecoration(color: _decorationColor),
//        child: Builder(builder: (context){
//          return FlatButton(
//            onPressed: () {
//              if (_decorationColor == Colors.red) {
//                ImplicitlyAnimatedWidgetState _state = context.findAncestorStateOfType();
//                // 通过controller来启动反向动画
//                _state.controller.reverse().then((e) {
//                  // 经验证必须调用setState来触发rebuild，否则状态同步会有问题
//                  setState(() {
//                    _decorationColor = Colors.blue;
//                  });
//                });
//              } else {
//                setState(() {
//                  _decorationColor = Colors.red;
//                });
//              }
//            },
//            child: Text(
//              "AnimatedDecoratedBox toggle",
//              style: TextStyle(color: Colors.white),
//            ),
//          );
//        }),
//      ),
      body: AnimatedDecoratedBox(
        duration: Duration(
          milliseconds: _decorationColor == Colors.red ? 400 : 2000
        ),
        decoration: BoxDecoration(color: _decorationColor),
        child: Builder(builder: (context) {
          return FlatButton(
            onPressed: () {
              setState(() {
                _decorationColor = _decorationColor == Colors.blue ? Colors.red : Colors.blue;
              });
            },
            child: Text(
              "AnimatedDecoratedBox toggle",
              style: TextStyle(color: Colors.white),
            ),
          );
        }),
      ),
    );
  }

}