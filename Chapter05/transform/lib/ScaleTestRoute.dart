import 'package:flutter/material.dart';

class ScaleTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale test"),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.scale(
            scale: 1.5, // 放大到1.5倍
            child: Text("Hello world"),
          ),
        ),
      ),
    );
  }

}