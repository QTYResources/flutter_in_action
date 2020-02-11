import 'package:flutter/material.dart';

// 一个通用的InheritedWidget，保存任何需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {

  InheritedProvider({
    @required this.data,
    Widget child,
  }) : super(child: child);

  // 共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 在此简单返回true，则每次更新都会调用依赖器的子孙节点的`didChangeDependencies1`
    return true;
  }
  
}