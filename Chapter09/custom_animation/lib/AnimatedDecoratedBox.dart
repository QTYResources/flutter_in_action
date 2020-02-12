import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {

  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,  // 动画曲线
    @required Duration duration,  // 正向动画执行时长
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
  );

  final BoxDecoration decoration;
  final Widget child;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => AnimatedDecoratedBoxState();

}

class AnimatedDecoratedBoxState extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {

  DecorationTween _decoration;  // 定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration, (value) => DecorationTween(begin: value));
  }

}