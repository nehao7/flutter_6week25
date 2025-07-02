import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureDetectorScreen extends StatefulWidget {
  const GestureDetectorScreen({super.key});

  @override
  State<GestureDetectorScreen> createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Gesture Toast Example")),
      body: Center(
        child:
        Column(
        children: [
          GestureDetector(
          onTap: () => showToast("Tapped!"),
          onDoubleTap: () => showToast("Double Tapped!"),
          onLongPress: () => showToast("Long Pressed!"),
          onTapDown: (_) => showToast("Tap Down"),
          onTapUp: (_) => showToast("Tap Up"),
          onTapCancel: () => showToast("Tap Cancelled"),
          onVerticalDragStart: (_) => showToast("Vertical Drag Start"),
          onVerticalDragUpdate: (_) => showToast("Vertical Drag Update"),
          onVerticalDragEnd: (_) => showToast("Vertical Drag End"),
          // onHorizontalDragUpdate: (_) => showToast("Horizontal Drag Update"),
          onPanStart: (_) => showToast("Pan Start"),
          onPanUpdate: (_) => showToast("Pan Update"),
          onPanEnd: (_) => showToast("Pan End"),
          // onScaleStart: (_) => showToast("Scaling Started"),
          // onScaleUpdate: (_) => showToast("Scaling..."),
          // onScaleEnd: (_) => showToast("Scaling Ended"),
          child: Container(
            padding: EdgeInsets.all(50),
            color: Colors.orangeAccent,
            child: Text(
              "Gesture Me!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ],
        ),
      ),
    );
  }
}
