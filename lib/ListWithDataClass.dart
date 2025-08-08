import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWithDataClass extends StatefulWidget {
  const ListWithDataClass({super.key});

  @override
  State<ListWithDataClass> createState() => _ListWithDataClassState();
}

class _ListWithDataClassState extends State<ListWithDataClass> {
  final List<User> userList = [
    User(name: 'Alice', age: 25),
    User(name: 'Bob', age: 30),
    User(name: 'Charlie', age: 28),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0])),
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}'),
          );
        },
      ),
    );
  }
}


class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}