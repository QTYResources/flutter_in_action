import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotateTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotate test"),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("Hello world"),
          ),
        ),
      ),
    );
  }

}