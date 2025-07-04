import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewWithCustomScroll extends StatefulWidget {
  const ListViewWithCustomScroll({super.key});

  @override
  State<ListViewWithCustomScroll> createState() => _ListViewWithCustomScrollState();
}

class _ListViewWithCustomScrollState extends State<ListViewWithCustomScroll> {
  List<String> verticalList = ['Item 1', 'Item 2', 'Item 2', 'Item 2', 'Item 2', 'Item 2', 'Item 3'];
  List<String> horizontalList = ['Box A', 'Box B', 'Box C'];
  final TextEditingController controller = TextEditingController();

  void addItem(List<String> list, String newItem) {
    setState(() {
      list.add(newItem);
    });
  }

  void updateItem(List<String> list, int index, String updatedItem) {
    setState(() {
      list[index] = updatedItem;
    });
  }

  void deleteItem(List<String> list, int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void showCrudDialog({required bool isVertical, int? index}) {
    bool isUpdate = index != null;
    final list = isVertical ? verticalList : horizontalList;
    controller.text = isUpdate ? list[index!] : "";

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isUpdate ? "Update Item" : "Add Item"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Enter item text"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (isUpdate) {
                updateItem(list, index!, controller.text);
              } else {
                addItem(list, controller.text);
              }
              controller.clear();
              Navigator.pop(ctx);
            },
            child: Text(isUpdate ? "Update" : "Add"),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(List<String> list, bool isVertical, int index) {
    return GestureDetector(
      onTap: () => showCrudDialog(isVertical: isVertical, index: index),
      onLongPress: () => deleteItem(list, index),
      child: Container(
        margin: EdgeInsets.all(8),
        width: isVertical ? double.infinity : 120,
        height: 60,
        color: Colors.teal[100 * ((index % 8) + 1)],
        child: Center(child: Text(list[index])),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView CRUD + No Scroll"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showCrudDialog(isVertical: true),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text("Horizontal List (Tap to Edit, Long Press to Delete)"),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: horizontalList.length,
              itemBuilder: (context, index) => buildListItem(horizontalList, false, index),
            ),
          ),
          Divider(),
          Text("Vertical List (Tap to Edit, Long Press to Delete)"),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: verticalList.length,
              itemBuilder: (context, index) => buildListItem(verticalList, true, index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCrudDialog(isVertical: false),
        child: Icon(Icons.add),
        tooltip: "Add to Horizontal List",
      ),
    );
  }
}