import 'dart:convert';
import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Image Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePageU(),
    );
  }
}

class MyHomePageU extends StatefulWidget {
  const MyHomePageU({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageU> {
  Uint8List? _selectedImage;

  void _pickImage() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files!.length == 1) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((loadEndEvent) {
          setState(() {
            _selectedImage = Uint8List.fromList(reader.result as List<int>);
          });
        });
      }
    });
  }

  Future<void> _sendImageToServer() async {
    if (_selectedImage != null) {
      // Replace the URL with your server endpoint
      const String url = 'http://172.23.208.13:5050/memberdetails';

      try {
        // Encode the image bytes to base64
        String base64Image = base64Encode(_selectedImage!);

        // Create the request body
        Map<String, String> headers = {"Content-type": "application/json"};
        Map<String, dynamic> requestBody = {"image": base64Image};

        // Convert the request body to JSON
        String jsonBody = jsonEncode(requestBody);

        // Send the HTTP POST request
        http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonBody,
        );

        // Check the response status
        if (response.statusCode == 200) {
          //print('Image uploaded successfully');
        } else {
          //print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (error) {
        //print('Error: $error');
      }
    } else {
      //print('Please select an image first');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedImage != null
                ? Image.memory(
                    _selectedImage!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 200,
                    height: 200,
                    color: Colors.grey,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendImageToServer,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
