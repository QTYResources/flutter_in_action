import 'package:flutter/material.dart';

class FixedHeaderRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fixed Header"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表")),
  //        SizedBox(
  //          // Material设计规范中状态栏、导航栏、ListTitle高度分别为24、56、56
  //          height: MediaQuery.of(context).size.height - 24 - 56 - 56,
  //          child: ListView.builder(
  //            itemBuilder: (context, index) {
  //              return ListTile(title: Text("$index"));
  //            },
  //          ),
  //        ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              },
            ),
          ),
        ],
      ),
    );
  }

}