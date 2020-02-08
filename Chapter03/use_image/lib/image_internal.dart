import 'package:flutter/material.dart';

class ImageInternalTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageInternal"),
      ),
      body: Column(
        children: <Widget>[
          MyImage(
            imageProvider: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581159991606&di=8ff50b926627214023729cdf7901e9d3&imgtype=0&src=http%3A%2F%2Fac-r.static.booking.cn%2Fimages%2Fhotel%2Fmax1024x768%2F175%2F17552265.jpg",),
          ),
        ],
      ),
    );
  }

}

class MyImage extends StatefulWidget {

  const MyImage({
    Key key,
    @required this.imageProvider,
  }) : assert(imageProvider != null), super(key: key);

  final ImageProvider imageProvider;

  @override
  State<StatefulWidget> createState() => MyImageState();

}

class MyImageState extends State<MyImage> {

  ImageStream imageStream;
  ImageInfo imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // we call getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    getImage();
  }

  @override
  void didUpdateWidget(MyImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      getImage();
    }
  }

  void getImage() {
    final ImageStream oldImageStream = imageStream;
    imageStream = widget.imageProvider.resolve(createLocalImageConfiguration(context));
    if (imageStream.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final ImageStreamListener listener = ImageStreamListener(updateImage);
      oldImageStream?.removeListener(listener);
      imageStream.addListener(listener);
    }
  }

  void updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      this.imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    imageStream?.removeListener(ImageStreamListener(updateImage));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return RawImage(
        image: imageInfo?.image,
        scale: imageInfo?.scale ?? 1.0,
      );
  }
}


