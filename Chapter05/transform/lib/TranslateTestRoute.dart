import 'package:flutter/material.dart';

class TranslateTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate test"),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          // 默认原点为左上角，左移20像素，向上平移5像素
          child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),
          ),
        ),
      ),
    );
  }

}