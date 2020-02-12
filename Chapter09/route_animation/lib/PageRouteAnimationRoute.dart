import 'package:flutter/material.dart';

class PageRouteAnimationRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test pageroute animator"),
      ),
      body: Center(
        child: Text("测试路由切换动画"),
      ),
    );
  }

}