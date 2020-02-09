import 'package:flutter/material.dart';

class WrapTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Wrap(
        spacing: 8.0, // 主轴（水平）方向间距
        runSpacing: 4.0,  // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center,  // 沿主轴方向居中
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text("A"),),
            label: new Text('Hamilton'),
          ),
          new Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('Ms'),),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H'),),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J'),),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }

}