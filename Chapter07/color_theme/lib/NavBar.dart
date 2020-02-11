import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {

  final String title;
  final Color color;  // 背景颜色

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavBar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
          constraints: BoxConstraints(
          minWidth: 23.0,
          minHeight: 56.0,
          ),
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              // 阴影
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 3),
                blurRadius: 3,
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // 根据背景色亮度来确定Title颜色
              color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
            ),
          ),
          alignment: Alignment.center,
        ),
        ],
      )
    );
  }

}