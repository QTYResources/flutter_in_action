import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebviewRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => WebviewRouteState();

}

class WebviewRouteState extends State<WebviewRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: WebView(
        initialUrl: "https://flutterchina.club",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}