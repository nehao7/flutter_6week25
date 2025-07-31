import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SQFLiteHelper.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  final textEditingController= TextEditingController();
  final helper= SQFLiteHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo App')),
        body: FutureBuilder(
          //helper.getTasks() returns a Future<List<Map<String, dynamic>>>.
            future: helper.getTasks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Checkbox(
                              value: snapshot.data?[index]['status'] == 1
                                  ? true
                                  : false,
                              onChanged: (value) async {
                                await helper.updateTask(
                                    snapshot.data?[index]['id'], value!);
                                setState(() {});
                              }),
                          title: Text(snapshot.data?[index]['title']),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await helper
                                    .deleteTask(snapshot.data?[index]['id']);
                                setState(() {});
                              }));
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('Add Task'),
                        content: TextField(
                            autofocus: true,
                            controller: textEditingController,
                            decoration:  InputDecoration(
                              hintText: 'Enter title',
                            )),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                await helper.insertTask(
                                    textEditingController.text, false);
                                textEditingController.clear();
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                                setState(() {});
                              },
                              child: const Text('Add'))
                        ]);
                  });
            },
            child: const Icon(Icons.add)
        )
    );
  }
}
