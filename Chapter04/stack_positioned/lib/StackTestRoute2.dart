import 'package:flutter/material.dart';

class StackTestRoute2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Test2"),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, // 未定位widget占满Stack整个空间
        children: <Widget>[
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          ),
        ],
      ),
    );
  }

}