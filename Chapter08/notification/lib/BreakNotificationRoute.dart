import 'package:flutter/material.dart';
import 'package:notification/MyNotification.dart';

class BreakNotificationRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BreakNotificationRouteState();

}

class BreakNotificationRouteState extends State<BreakNotificationRoute> {

  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("中断通知"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          print(notification.msg);  // 打印通知
          return false;
        },
        child: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg + " ";
            });
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//                RaisedButton(
//                  child: Text("Send Notification"),
//                  onPressed: () {
//                    MyNotification("Hi").dispatch(context);
//                  },
//                ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      // 按钮点击时分发通知
                      child: Text("Send Notification"),
                      onPressed: () => MyNotification("Hi").dispatch(context),
                    );
                  },
                ),
                Text(_msg),
              ],
            ),
          ) ,
        ),
      ),
    );
  }

}