import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraAndGalleryAcessScreen extends StatefulWidget {
  const CameraAndGalleryAcessScreen({super.key});

  @override
  State<CameraAndGalleryAcessScreen> createState() => _CameraAndGalleryAcessScreenState();
}

class _CameraAndGalleryAcessScreenState extends State<CameraAndGalleryAcessScreen> {
  File? galleryFile;
  final picker = ImagePicker();
  void _showPicker({
    required BuildContext context
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future getImage(
      ImageSource img,
      ) async {
    // pick image from gallary
    final pickedFile = await picker.pickImage(source: img);
    // store it in a valid variable
    XFile? xfilePick = pickedFile;
    setState(
          () {
        if (xfilePick != null) {
          // store that in global variable galleryFile in the form of File
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Access and Camera'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: const [
          Text(
            "GAC",
            textScaleFactor: 3,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  child: const Text('Select Image from Gallery and Camera'),
                  onPressed: () {
                    _showPicker(context: context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  child: galleryFile == null
                      ? const Center(child: Text('Sorry nothing selected!!'))
                      : Center(child: Image.file(galleryFile!)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
