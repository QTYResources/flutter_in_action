import 'package:flutter/material.dart';

class NestedRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nested"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, // 无效，内层Column高度为实际高度
                  children: <Widget>[
                    Text("hello world"),
                    Text("I an Jack "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}