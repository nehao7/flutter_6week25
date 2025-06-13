import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTypesScreen extends StatefulWidget {
  const ButtonTypesScreen({super.key});

  @override
  State<ButtonTypesScreen> createState() => _ButtonTypesScreenState();
}

class _ButtonTypesScreenState extends State<ButtonTypesScreen> {
  List<String> items = ['One', 'Two', 'Three'];
  String selectedValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Types"),
      ),
      body: Center(
       
      ),
    );
  }
}
