import 'package:event_bus/main.dart';
import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LoginRouteState();

}

class LoginRouteState extends State<LoginRoute> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("login"),
          onPressed: () {
            bus.emit("login");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

}