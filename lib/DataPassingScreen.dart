import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPassingScreen extends StatefulWidget {
  final String mydata;

  const DataPassingScreen({super.key, required this.mydata});

  @override
  State<DataPassingScreen> createState() => _DataPassingScreenState();
}

class _DataPassingScreenState extends State<DataPassingScreen> {
  String returnData = "Returned from Second";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(child:
          Column(
            children: [
          Text("${widget.mydata}"),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, returnData);
            },
            child: const Text('Go back with data'),
          )
            ],
          )
          )
    );
  }
}
