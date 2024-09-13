// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get_storage/get_storage.dart';
// import 'package:file_picker/file_picker.dart';

// class PdfUploadPage extends StatelessWidget {
//   final _storage = GetStorage();

//   Future<void> _uploadPdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       Uint8List fileBytes = result.files.single.bytes!;
//       String fileName = result.files.single.name;

//       // Encode file bytes to base64
//       String fileBase64 = base64Encode(fileBytes);

//       // Save file to local storage
//       await _storage.write('pdf', fileBase64);

//       // Send PDF file to Flask API
//       final url = 'http://172.23.208.13:5050/upload';
//       var response = await http.post(
//         Uri.parse(url),
//         body: {'file': fileName, 'fileBytes': fileBase64},
//       );

//       if (response.statusCode == 200) {
//         print('PDF uploaded successfully');
//       } else {
//         print('Failed to upload PDF. Status code: ${response.statusCode}');
//         print('${response.body}');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Upload'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _uploadPdf,
//           child: Text('Upload PDF'),
//         ),
//       ),
//     );
//   }
// }
