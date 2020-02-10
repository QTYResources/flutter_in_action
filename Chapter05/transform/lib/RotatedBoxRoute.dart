import 'package:flutter/material.dart';

class RotatedBoxRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotatedBox"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              // 将Transform.rotate换成RotateBox
              child: RotatedBox(
                quarterTurns: 1,  // 旋转90度（1/4圈）
                child: Text("Hello world"),
              ),
            ),
            Text(
              "你好",
              style: TextStyle(
                color: Colors.green,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

}