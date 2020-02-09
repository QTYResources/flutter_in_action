import 'package:flutter/material.dart';

class StackTestRoute1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Test 1'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,  // 指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: Text(
                'Hello world',
                style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }

}