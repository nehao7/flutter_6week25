import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreListCrud extends StatefulWidget {
  const FireStoreListCrud({super.key});

  @override
  State<FireStoreListCrud> createState() => _FireStoreListCrudState();
}

class _FireStoreListCrudState extends State<FireStoreListCrud> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Add document
  Future<void> addUser(String name) async {
    if (name.trim().isEmpty) return;
    await users.add(
        {'name': name.trim()}
    );
    _controller.clear();
  }

  // Update document
  Future<void> updateUser(String docId, String newName) async {
    await users.doc(docId).update({'name': newName});
  }

  // Delete document
  Future<void> deleteUser(String docId) async {
    await users.doc(docId).delete();
  }

  void showEditDialog(String docId, String currentName) {
    final editController = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit User'),
        content: TextField(controller: editController),
        actions: [
          TextButton(
            onPressed: () {
              updateUser(docId, editController.text);
              Navigator.pop(context);
            },
            child: Text('Update'),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Firestore ListView CRUD')),
      body: Column(
        children: [
          // Add user input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addUser(_controller.text),
                )
              ],
            ),
          ),

          // Live list from Firestore
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final name = doc['name'];

                    return ListTile(
                      title: Text(name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showEditDialog(doc.id, name),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteUser(doc.id),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}