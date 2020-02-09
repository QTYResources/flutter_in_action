import 'package:flutter/material.dart';

class ExpandedRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  // 垂直方向居中对齐
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack "),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}