import 'package:flutter/material.dart';

class ListViewTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView text"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          const Text("I'm dedicating every day to you"),
          const Text("Domestic life was never quite my style"),
          const Text("When you smile, you knock me out, I fall apart"),
          const Text("And I thought I was so smart"),
        ],
      ),
    );
  }

}