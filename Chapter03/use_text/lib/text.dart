import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

class TextRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TextRouteState();

}

class TextRouteState extends State<TextRoute> {

  TapGestureRecognizer tapRecognizer;

  @override
  void initState() {
    tapRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  void dispose() {
    tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserText"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Hello world",
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world " * 6,   // 字符串重复六次
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Text(
              "Raleway font",
              style: TextStyle(
                inherit: false,
                color: Colors.lightGreen,
                fontFamily: "Raleway",
              ),
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                    recognizer: tapRecognizer..onTap = () {
                      print("http tap.");
                    },
                ),
              ]),
            ),
            DefaultTextStyle(
              // 1. 设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                      inherit: false, // 2. 不继承默认样式
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}