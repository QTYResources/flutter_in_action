import 'package:flutter/material.dart';

class ListViewSeparatedRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 下划线widget预定义以供服用
    Widget divider1 = Divider(color: Colors.blue, height: .5);
    Widget divider2 = Divider(color: Colors.green, height: .5);
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView separated"),
      ),
      body: ListView.separated(
        itemCount: 100,
        // 列表构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        // 分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }

}