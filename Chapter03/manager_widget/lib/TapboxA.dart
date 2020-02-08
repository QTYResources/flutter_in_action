// TapboxA管理自身状态
// ----------------------TapboxA--------------------
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {

  TapboxA({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new TapboxAState();
}

class TapboxAState extends State<TapboxA> {

  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}