import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {

  MyRichText({
    Key key,
    this.text,  // 文本字符串
    this.linkStyle, // url链接样式
  }): super(key: key);

  final String text;
  final TextStyle linkStyle;

  @override
  State<StatefulWidget> createState() => MyRichTextState();

}

class MyRichTextState extends State<MyRichText> {

  TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: _textSpan,
    );
  }

  TextSpan parseText(String text) {
    // 耗时操作： 解析文本字符串，构建出TextSpan.
    // 省略具体实现
  }

  @override
  void initState() {
    _textSpan = parseText(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parseText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }

}