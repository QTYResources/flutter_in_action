import 'package:dialog/DialogCheckbox.dart';
import 'package:dialog/DialogCheckboxRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("删除对话框"),
              onPressed: () async {
                // 弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  // ... 删除文件
                }
              },
            ),
            RaisedButton(
              child: Text("选择对话框"),
              onPressed: () {
                changeLanguage();
              },
            ),
            RaisedButton(
              child: Text("列表对话框"),
              onPressed: () {
                showListDialog();
              },
            ),
            RaisedButton(
              child: Text("自定义对话框"),
              onPressed: () {
                showCustomDeleteDialog();
              },
            ),
            RaisedButton(
              child: Text("管理对话框1（不可选中）"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DialogCheckboxRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("管理对话框2（可选中）"),
              onPressed: () async {
                // 弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog2();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录：$deleteTree");
                }
              },
            ),
            RaisedButton(
              child: Text("管理对话框3（可选中）"),
              onPressed: () async {
                // 弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog3();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录：$deleteTree");
                }
              },
            ),
            RaisedButton(
              child: Text("管理对话框4（可选中）"),
              onPressed: () async {
                // 弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog4();
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录：$deleteTree");
                }
              },
            ),
            RaisedButton(
              child: Text("显示底部菜单列表"),
              onPressed: () async {
                int type = await _showModalBottonSheet();
                print(type);
              },
            ),
            RaisedButton(
              child: Text("显示底部菜单列表(非模态)"),
              onPressed: () async {
                // 有问题
                _showBottomSheet();
              },
            ),
            RaisedButton(
              child: Text("加载对话框"),
              onPressed: () {
                showLoadingDialog();
              },
            ),
            RaisedButton(
              child: Text("指定宽度加载对话框"),
              onPressed: () {
                showLimitWidthLoadingDialog();
              },
            ),
            RaisedButton(
              child: Text("Android日历选择对话框"),
              onPressed: () {
                showAndroidDataPicker();
              },
            ),
            RaisedButton(
              child: Text("iOS日历选择对话框"),
              onPressed: () {
                showiOSDatePicker();
              },
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("你确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),   // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // ... 执行删除操作
                Navigator.of(context).pop(true);  // 关闭对话框
              },
            )
          ],
        );
      }
    );
  }

  // 选择对话框
  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("中文简体"),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text("美国英语"),
              ),
            ),
          ],
        );
      }
    );
    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  // 列表对话框
  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            ),
          ],
        );
        // 使用AlertDialog会保错
//        return AlertDialog(content: child);
//        return Dialog(child: child);
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 375),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  // 自定义删除对话框
  Future<bool> showCustomDeleteDialog() async {
    return showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      }
    );
  }

  // 自定义对话框
  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (context) {
           return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: buildMaterialDialogTransitions,
    );
  }

  Widget buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  // 可选中复选框对话框
  Future<bool> showDeleteConfirmDialog2() {
    bool _withTree = false; // 记录复选框是否可选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, // 默认不选中
                    onChanged: (value) {
                      // 更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 可选中复选框对话框3
  Future<bool> showDeleteConfirmDialog3() {
    bool _withTree = false; // 记录复选框是否可选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  // 使用StatefulBuilder来构建StatefulWidget上下文
                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: _withTree, // 默认不选中
                        onChanged: (value) {
                          // _setState方法实际就是该StatefulWidget的setState方法，
                          // 调用后builder方法会重新被调用
                          _setState(() {
                            // 更新选中状态
                            _withTree = !_withTree;
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 可选中复选框对话框4
  Future<bool> showDeleteConfirmDialog4() {
    bool _withTree = false; // 记录复选框是否可选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除文件吗？"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  Checkbox( // 依然使用Checkbox组件
                    value: _withTree,
                    onChanged: (value) {
                      // 此时context为对话框UI的根Element，我们
                      // 直接将对话框UI对应的Element标记为dirty
                      (context as Element).markNeedsBuild();
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottonSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      }
    );
  }

  // 返回的是一个controller
  PersistentBottomSheetController<int> _showBottomSheet() {
    return showBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  // 加载对话框1
  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,  // 点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              ),
            ],
          ),
        );
      }
    );
  }

  // 设置宽度的加载对话框
  void showLimitWidthLoadingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,  // 点击遮罩不关闭对话框
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Text("正在加载，请稍后..."),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  // Android日历对话框
  Future<DateTime> showAndroidDataPicker() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( // 未来30天可选
        Duration(days: 30),
      ),
    );
  }

  // iOS日历对话框
  Future<DateTime> showiOSDatePicker() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(Duration(days: 30)),
            maximumYear: date.year + 1,
            onDateTimeChanged: (value) {
              print(value);
            },
          ),
        );
      }
    );
  }
}