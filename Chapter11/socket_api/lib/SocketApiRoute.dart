import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class SocketApiRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => SocketApiRouteState();

}

class SocketApiRouteState extends State<SocketApiRoute> {

  String _responseStr = "sdsfdwefafs";

  void request() async {
    // 建立连接
    var socket = await Socket.connect("baidu.com", 80);
    // 根据http协议，发送请求头
    socket.writeln("GET / HTTP/1.1");
    socket.writeln("Host:baidu.com");
    socket.writeln("Connection:close");
    socket.writeln();
    await socket.flush(); // 发送数据
    // 读取返回内容
    await socket.transform(StreamTransformer.fromHandlers(handleData: (data, snik) {
      print("data: " + utf8.decode(data));
      setState(() {
        _responseStr = utf8.decode(data);
      });
    })).join();
    await socket.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket API"),
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Test Socket API"),
                    onPressed: () {
                      request();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0 + 48.0 + 16.0),
              child: Text("$_responseStr"),
            ),
          ],
        ),
      ),
    );
  }
}