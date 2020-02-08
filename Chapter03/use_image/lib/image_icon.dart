import 'package:flutter/material.dart';

class ImageAndIconRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var img = AssetImage("imgs/avatar.png");
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageIcon"),
      ),
      body: SingleChildScrollView (
        child: Column(
          children: <Widget>[
            Text("Fill"),
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
            Text("contain"),
            Image(
              image: img,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            Text("cover"),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Text("FitWidth"),
            Image(
              image:img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Text("FitHeight"),
            Image(
              image:img,
              width:100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Text("ScaleDown"),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Text("None"),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.none,
            ),
            Text("Difference"),
            Image(
              image: img,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Text("RepeatY"),
            Image(
              image: img,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY,
            )
          ].map((e) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                      child: e,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

}