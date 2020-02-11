import 'package:flutter/material.dart';
import 'package:inherited_widget/TestWidget.dart';
import 'ShareDataWidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => InheritedWidgetTestRouteState();

}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited widget"),
      ),
      body: Center(
        child: ShareDataWidget( // 使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),  // 子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text("Increment"),
                // 每次点击一次，将count自增，然后重新build, ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              ),
            ],
          ),
        ),
      ),
    );
  }

}