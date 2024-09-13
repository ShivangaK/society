// import 'dart:html';
// import 'dart:typed_data';
// import 'dart:convert';
// import 'package:flutter/material.dart';

// class Membership_Form extends StatelessWidget {
//   const Membership_Form({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class UploadMember extends StatefulWidget {
//   const UploadMember({super.key});

//   @override
//   State<UploadMember> createState() => _UploadMemberState();
// }

// class _UploadMemberState extends State<UploadMember> {
//   Uint8List? _selectedImage;

//   void _pickImage() {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();

//     uploadInput.onChange.listen((event) {
//       final files = uploadInput.files;
//       if (files!.length == 1) {
//         final reader = html.FileReader();
//         reader.readAsArrayBuffer(files[0]);
//         reader.onLoadEnd.listen((loadEndEvent) {
//           setState(() {
//             _selectedImage = Uint8List.fromList(reader.result as List<int>);
//           });
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
