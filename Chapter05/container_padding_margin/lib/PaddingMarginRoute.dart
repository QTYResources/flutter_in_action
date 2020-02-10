import 'package:flutter/material.dart';

class PaddingMarginRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaddingMargin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0), // 内容外补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
            child: Text("Hello world"),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text("Hello world!"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Hello world"),
            ),
          ),
        ],
      ),
    );
  }

}