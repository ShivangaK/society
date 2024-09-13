// import 'dart:io';
// import 'dart:typed_data';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_image_picker/form_builder_image_picker.dart';

// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:society/custom_widgets/video_player.dart';
// import 'package:society/custom_widgets/videofirebase.dart';
// import 'package:video_player/video_player.dart';
// import 'package:web_video_player/player.dart';

// import '../app/modules/home/controllers/home_controller.dart';

// class MemberForm extends GetView<HomeController> {
//   // final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

//   final HomeController homeController = Get.put(HomeController());

//   final textController = TextEditingController();

//   // homeController.im
//   @override
//   Widget build(BuildContext context) {
//     // To clear previously selected Image, on Form Load
//     homeController.imageBytes.value = null;
//     return AlertDialog(
//       title: Text("Form Dialog"),
//       content: SingleChildScrollView(
//         child: FormBuilder(
//           // key: _formKey,
//           key: homeController.formKey,
//           skipDisabled: true,
//           child: Container(
//             height: Get.height * 0.75,
//             width: Get.width * 0.75,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       FormBuilderTextField(
//                         name: 'MEMBERSHIPID',
//                         decoration: InputDecoration(labelText: 'MembershipID'),
//                         // validator: FormBuilderValidators.required(),
//                       ),
//                       FormBuilderTextField(
//                         name: 'NAME',
//                         decoration: InputDecoration(labelText: 'Name'),
//                         validator: FormBuilderValidators.required(),
//                       ),
//                       FormBuilderDateTimePicker(
//                         name: 'DOB',
//                         format: DateFormat.yMd(),
//                         inputType: InputType.date,
//                         decoration: InputDecoration(
//                             labelText: 'Date of Birth (mm/dd/yyyy)',
//                             suffixIcon: Icon(Icons.calendar_month_rounded)),
//                       ),
//                       FormBuilderTextField(
//                         name: 'FATHER_HUSBAND_NAME',
//                         decoration:
//                             InputDecoration(labelText: 'Father/Husband Name'),
//                         validator: FormBuilderValidators.required(),
//                       ),
//                       FormBuilderTextField(
//                         name: 'EMAIL',
//                         decoration: InputDecoration(labelText: 'Email'),
//                         validator: FormBuilderValidators.email(),
//                       ),
//                       FormBuilderTextField(
//                         name: 'AADHAR_NO',
//                         decoration: InputDecoration(labelText: 'Aadhar No.'),
//                         validator: FormBuilderValidators.email(),
//                       ),
//                       FormBuilderTextField(
//                         name: 'ALTERNATE_EMAIL',
//                         decoration:
//                             InputDecoration(labelText: 'Alternate Email'),
//                         validator: FormBuilderValidators.email(),
//                       ),
//                       FormBuilderTextField(
//                         name: 'MOBILENO',
//                         controller: textController,
//                         decoration: InputDecoration(
//                           labelText: 'PhoneNumber',
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               if (textController.text.isNotEmpty) {
//                                 homeController.fetchMemberDetails(
//                                   int.parse(textController.text),
//                                 );
//                               }
//                             },
//                             icon: Icon(Icons.get_app_rounded),
//                           ),
//                         ),
//                         // validator: FormBuilderValidators.ph,
//                       ),

//                       // WebVideoPlayer(
//                       //   url:
//                       //       // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',

//                       //       'https://drive.google.com/file/d/1WwcuRqGZkh1i0zsMLWj0cPthP-77jCWO/view?usp=sharing',
//                       //   autoPlay: true,
//                       // ),

//                       GetBuilder<HomeController>(
//                         builder: (controller) => Expanded(
//                           child: controller.chewieController != null &&
//                                   controller.chewieController!
//                                       .videoPlayerController.value.isInitialized
//                               ? Chewie(controller: controller.chewieController!)
//                               : CircularProgressIndicator(),
//                         ),
//                       ),

//                       // SingleChildScrollView(
//                       //   child: Container(
//                       //     child: YourWidget(),
//                       //   ),
//                       // ),

//                       // WebVideoPlayer(
//                       //   url:
//                       //       "https://drive.google.com/file/d/1WwcuRqGZkh1i0zsMLWj0cPthP-77jCWO/view?usp=sharing",
//                       // ),
//                       // FormBuilderImagePicker(
//                       //   name: 'profilePic',
//                       //   // decoration: const InputDecoration(
//                       //   //   labelText:
//                       //   //       'Pick Single Photo With Decoration Visible',
//                       //   // ),
//                       //   // showDecoration: true,
//                       //   maxImages: 1,
//                       //   onChanged: (images) {
//                       //     homeController.imageBytes =
//                       //         images?.first.readAsBytesSync();
//                       //   },
//                       //   // previewAutoSizeWidth: true,
//                       //   // initialValue: const [
//                       //   //   'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//                       //   // ],
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Obx(() {
//                         final imageBytes = homeController.imageBytes.value;
//                         print("Inside view ${imageBytes?.length}");

//                         return imageBytes == null
//                             // () => homeController.imageUrlPic.value == null
//                             ? Column(
//                                 children: [
//                                   Text(
//                                     'Select Image from Camera/gallery',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 250,
//                                     width: 250,
//                                     child: CircleAvatar(
//                                       backgroundImage:
//                                           AssetImage('web/gruhaslogo.png'),
//                                     ),
//                                     // child: CircularAvatar('web/gruhaslogo.jpeg'),
//                                   ),
//                                 ],
//                               )
//                             : CircleAvatar(
//                                 radius: 120.0,
//                                 child: Image.memory(
//                                   homeController.imageBytes.value!,
//                                   // fit: BoxFit.contain,
//                                 ),
//                                 // child: Image.network(
//                                 // homeController.imageUrlPic.value),
//                                 // child: FormBuilderImagePicker(
//                                 //   name: 'profileImage1',
//                                 //   maxImages: 1,
//                                 // ),
//                                 // backgroundImage: NetworkImage(
//                                 //     homeController.imageBytes.value),
//                               );
//                       }),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             onPressed: null,
//                             // () async {
//                             //   await homeController.sendFormValuetoAPI();
//                             // },
//                             // homeController.getImage(ImageSource.camera),
//                             icon: Icon(
//                               Icons.save,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           IconButton(
//                             onPressed: null,
//                             //  homeController.picImage(),
//                             // final pickedFile = await ImagePicker()
//                             //     .pickImage(source: ImageSource.gallery);
//                             // if (pickedFile == null) return;
//                             // homeController.selectedImagePath.value =
//                             //     pickedFile.path;

//                             //Uncomment to work on Desktop
//                             //     () {

//                             //   homeController.pickImage();
//                             // },
//                             icon: Icon(
//                               Icons.image_search_rounded,
//                               size: 26,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Get.back();
//           },
//           child: Text("Cancel"),
//         ),
//         TextButton(
//           onPressed: () {
//             if (homeController.formKey.currentState!.saveAndValidate()) {
//               // Form is valid, process the data
//               final formData = homeController.formKey.currentState!.value;
//               print("Form data: ${homeController.formKey.currentState!.value}");

//               if (homeController
//                       .formKey.currentState!.fields['MEMBERSHIPID']!.value ==
//                   null) {
//                 print('Inside Save to API');
//                 homeController.sendToAPIForSave(formData);
//               } else {
//                 print('Inside Edit to API');
//                 homeController.memberDetailsEdit(formData);
//               }

//               // Get.back();
//             }
//           },
//           child: Text("Submit"),
//         ),
//       ],
//     );
//   }
// }
