import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownMenu2dArray extends StatefulWidget {
  const DropdownMenu2dArray({super.key});

  @override
  State<DropdownMenu2dArray> createState() => _DropdownMenu2dArrayState();
}

class _DropdownMenu2dArrayState extends State<DropdownMenu2dArray> {
  final List<List<String>> options = [
    ['1', 'One'],
    ['2', 'Two'],
    ['3', 'Three'],
  ];

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown with 2D Array")),
      body: Center(
        child: DropdownButton<String>(
          hint: Text("Select a value"),
          value: selectedValue,
          items: options.map((pair) {
            return DropdownMenuItem<String>(
              value: pair[0], // You can also use pair.join() or pair[1]
              child: Text(pair[1]), // Show the second item
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
