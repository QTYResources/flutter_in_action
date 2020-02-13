import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => WebSocketRouteState();

}

class WebSocketRouteState extends State<WebSocketRoute> {

  TextEditingController _controller = TextEditingController();
  WebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    super.initState();
    // 创建websocker连接
    channel = WebSocketChannel.connect(Uri.parse('ws://echo.websocket.org'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket（内容回显）"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Send a message"),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                // 网络不通会走到这
                if (snapshot.hasError) {
                  _text = "网络不通...";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Send message",
        child: Icon(Icons.send),
        onPressed: _sendMessage,
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

}