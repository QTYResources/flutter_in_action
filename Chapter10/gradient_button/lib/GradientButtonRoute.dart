import 'package:flutter/material.dart';
import 'package:gradient_button/GradientButton.dart';

class GradientButtonRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GradientButtonRouteState();

}

class GradientButtonRouteState extends State<GradientButtonRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义组件"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[700]],
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightBlue[300], Colors.blueAccent],
              child: Text("Submit"),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    print("button click");
  }

}