import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesScreen extends StatefulWidget {
  const SharedPrefrencesScreen({super.key});

  @override
  State<SharedPrefrencesScreen> createState() => _SharedPrefrencesScreenState();
}


class _SharedPrefrencesScreenState extends State<SharedPrefrencesScreen> {
  String savedName = "";
  final TextEditingController _controller = TextEditingController();

  Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", name);
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString("username") ?? "No name saved";
    });
  }

  Future<void> removeName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    await loadName();
  }

  @override
  void initState() {
    super.initState();
    loadName();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("SharedPreferences Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Saved Name: $savedName"),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Enter name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveName(_controller.text);
                await loadName();
              },
              child: const Text("Save Name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await removeName();
              },
              child: const Text("Remove Name"),
            ),
          ],
        ),
      ),
    );
  }
}
