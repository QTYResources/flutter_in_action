import 'package:flutter/material.dart';

class SwitchAndCheckBoxRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => SwitchAndCheckBoxRouteState();

}

class SwitchAndCheckBoxRouteState extends State<SwitchAndCheckBoxRoute> {

  bool switchSelected = true; // 维护单选开关状态
  bool checkboxSelected = true; // 维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchAndCheckBox"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Switch(
                value: switchSelected,  // 当前状态
                onChanged: (value) {
                  // 重新构建页面
                  setState(() {
                    switchSelected = value;
                  });
                },
              ),
              Text("关"),
              Switch(
                value: !switchSelected, // 当前状态
                onChanged: (value) {

                },
              ),
              Text("开"),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: checkboxSelected,
                activeColor: Colors.red,  // 选中颜色
                onChanged: (value) {
                  setState(() {
                    checkboxSelected = value;
                  });
                },
              ),
              Text("未选中"),
              Checkbox(
                value: !checkboxSelected,
                activeColor: Colors.red,  // 选中时的颜色
                onChanged: (value) {

                },
              ),
              Text("选中"),
            ],
          ),
        ],
      ),
    );
  }
}