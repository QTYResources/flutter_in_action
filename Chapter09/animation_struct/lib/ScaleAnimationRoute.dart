import 'package:animation_struct/AnimatedImage.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ScaleAnimationRouteState();

}

// 需要继承TickerProvider，如果有多个AnimationController，则应该使用TrickerProviderStateMixin。
class ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
//    // 图片宽高从0变到300
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)..addListener(() {
//      setState(() {});
//    });
//    // 启动动画（正向执行）
//    controller.forward();

    // 使用弹性曲线
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    );
    // 图片宽高从0到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)..addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    // 启动动画(正向）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画结构"),
      ),
//      body: Center(
//        child: Image.asset(
//          "imgs/avatar.png",
//          width: animation.value,
//          height: animation.value,
//        ),
//      ),
//      body: AnimatedImage(animation: animation),
      body: AnimatedBuilder(
        animation: animation,
        child: Image.asset("imgs/avatar.png"),
        builder: (ctx, child) {
          return Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // 路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

}