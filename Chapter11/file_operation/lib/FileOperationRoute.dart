import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {

  FileOperationRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FileOperationRouteState();

}

class FileOperationRouteState extends State<FileOperationRoute> {

  int _counter;

  @override
  void initState() {
    super.initState();
    // 从文件读取点击次数
    readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Center(
        child: Text("点击了 $_counter 次"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

}