import 'package:flutter/material.dart';
import 'package:notification/MyNotification.dart';

class NotificationRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => NotificationRouteState();

}

class NotificationRouteState extends State<NotificationRoute> {

  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + " ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//              RaisedButton(
//                child: Text("Send Notification"),
//                onPressed: () => MyNotification("Hi").dispatch(context),
//              ),
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
        ),
      ),
    );
  }

}