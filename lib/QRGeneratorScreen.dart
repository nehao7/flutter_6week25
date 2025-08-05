import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String qrData = "Welcome to Neha's QR"; // default QR code data
  final qrTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final qrCode = QrCode(4, QrErrorCorrectLevel.L)
    //   ..addData('Hello, world in QR form!');
    // final qrImage = QrImage(qrCode);
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 250,
            ),
            SizedBox(height: 20),
            TextField(
              controller: qrTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter data to generate QR code',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  qrData = qrTextController.text;
                });
              },
              child: Text("Generate QR Code"),
            ),
          ],
        ),
      ),
    );
  }

}
