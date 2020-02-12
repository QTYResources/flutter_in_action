import 'package:custom_animation/AnimatedDecoratedBox1.dart';
import 'package:flutter/material.dart';

class AnimatedDecoratedBox1Route extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AnimatedDecoratedBox1RouteState();

}

class AnimatedDecoratedBox1RouteState extends State<AnimatedDecoratedBox1Route> {

  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDecoratedBox"),
      ),
      body: AnimatedDecoratedBox1(
        duration: duration,
        decoration: BoxDecoration(color: _decorationColor),
        child: FlatButton(
          onPressed: () {
            setState(() {
              _decorationColor = Colors.red;
            });
          },
          child: Text(
            "AnimatedDecoratedBox",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

}