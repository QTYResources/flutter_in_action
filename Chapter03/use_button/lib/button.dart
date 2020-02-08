import 'package:flutter/material.dart';

class ButtonRoute extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => ButtonRouteState();
  
}

class ButtonRouteState extends State<ButtonRoute> {

  void onPressed() {
    print("button pressed");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UseButton"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () => {},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => {},
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => {},
          ),
          RaisedButton.icon(
              onPressed: onPressed,
              icon: Icon(Icons.send),
              label: Text("发送")
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: onPressed,
          ),
          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}