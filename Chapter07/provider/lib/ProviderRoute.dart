import 'package:flutter/material.dart';
import 'package:provider/CartModel.dart';

import 'ChangeNotifierProvider.dart';
import 'Item.dart';

class ProviderRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ProviderRouteState();

}

class ProviderRouteState extends State<ProviderRoute> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
//              Builder(builder: (context) {
//                var cart = ChangeNotifierProvider.of<CartModel>(context);
//                return Text("总价：${cart.totalPrice}");
//              }),
              Consumer<CartModel>(
                builder: (context, cart) => Text("总价：${cart.totalPrice}"),
              ),
              Builder(builder: (context) {
                print("RaisedButton build");  // 在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    // 给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));
                  },
                );
              })
            ],
          );
        }),
      ),
    );
  }

}

// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key key,
    @required this.builder,
    this.child,
  })  : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context), //自动获取Model
    );
  }
}