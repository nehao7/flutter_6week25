import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ZoomScreen extends StatefulWidget {
  const ZoomScreen({super.key});

  @override
  State<ZoomScreen> createState() => _ZoomScreenState();
}

void disableScreenshot() async {
  final _noScreenshot = NoScreenshot.instance;
  bool result = await _noScreenshot.screenshotOff();
  debugPrint('Screenshot Off: $result');
  Fluttertoast.showToast(
    msg: "Screenshorts Disabled",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0,
  );


}
class _ZoomScreenState extends State<ZoomScreen> {

  @override
  void initState() {
    super.initState();
    disableScreenshot();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Appinio Zoom Widget'),
      ),
      child: Center(
        child: WidgetZoom(
          heroAnimationTag: 'tag',
          zoomWidget: Image.network(
            'https://picsum.photos/seed/picsum/200/300',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
