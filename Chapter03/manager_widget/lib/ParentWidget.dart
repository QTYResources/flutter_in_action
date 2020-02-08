// ParentWidget为TapboxB管理状态
// -----------------------ParentWidget---------------------
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new ParentWidgetState();

}

class ParentWidgetState extends State<ParentWidget> {

  bool active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: active,
        onChanged: handleTapboxChanged,
      ),
    );
  }
}

// --------------------TapboxB------------------
class TapboxB extends StatelessWidget {

  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Infactive',
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