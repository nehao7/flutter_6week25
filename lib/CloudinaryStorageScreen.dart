import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class CloudinaryStorageScreen extends StatefulWidget {
  const CloudinaryStorageScreen({super.key});

  @override
  State<CloudinaryStorageScreen> createState() => _CloudinaryStorageScreenState();
}
class _CloudinaryStorageScreenState extends State<CloudinaryStorageScreen> {
  File? _selectedImage;
  String? _uploadedImageUrl;
  bool _isUploading = false;

  Future<void> pickAndUploadImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    setState(() {
      _selectedImage = File(pickedFile.path);
      _isUploading = true;
    });

    final imageUrl = await uploadImageToCloudinary(_selectedImage!);

    setState(() {
      _uploadedImageUrl = imageUrl;
      _isUploading = false;
    });
  }

  Future<String?> uploadImageToCloudinary(File imageFile) async {
    final cloudName = 'dbicko3lk';
    final uploadPreset = 'flutter_img_upload';

    final uri = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

    final request = http.MultipartRequest('POST', uri)
      ..fields['upload_preset'] = uploadPreset
      ..files.add(await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType.parse(lookupMimeType(imageFile.path) ?? 'image/jpeg'),
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final resStr = await response.stream.bytesToString();
      final jsonRes = json.decode(resStr);
      return jsonRes['secure_url'];
    } else {
      print('Upload failed: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Cloudinary Upload')),
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isUploading ? null : pickAndUploadImage,
                child: Text(_isUploading ? 'Uploading...' : 'Pick & Upload Image'),
              ),
              SizedBox(height: 20),
              if (_uploadedImageUrl != null)
                Column(
                  children: [
                    Image.network(
                      _uploadedImageUrl!,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),

                    SelectableText(
                      _uploadedImageUrl!,
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

              if (_isUploading)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
