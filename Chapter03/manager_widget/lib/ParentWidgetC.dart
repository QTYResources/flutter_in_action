// widget混合管理
// -------------------------ParentWidgetC-------------------------
import 'package:flutter/material.dart';

class ParentWidgetC extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new ParentWidgetCState();

}

class ParentWidgetCState extends State<ParentWidgetC> {

  bool active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: active,
        onChanged: handleTapboxChanged,
      ),
    );
  }

}

// ------------------------TapboxC-----------------------
class TapboxC extends StatefulWidget {

  TapboxC({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() => new TapboxCState();

}

class TapboxCState extends State<TapboxC> {

  bool highlight = false;

  void handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  void handleTapUp(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  void handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  void handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: handleTapDown, // 处理按下事件
      onTapUp: handleTapUp, // 处理抬起事件
      onTap: handleTap,
      onTapCancel: handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10.0,
          ) : null,
        ),
      ),
    );
  }
}