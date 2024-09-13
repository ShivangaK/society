// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
// Uncomment to work on Desktop
// import 'dart:html' as html;
import 'package:chewie/chewie.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:intl/intl.dart';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:society/app/modules/home/memberFormModel.dart';
import 'package:society/app/modules/home/providers/home_provider.dart';
import 'package:society/app/modules/otp/controllers/otp_controller.dart';
import 'package:society/constants.dart';
import 'package:society/numeric_constants.dart';
import 'package:society/text_constants.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  String language = 'E';
  String companyName = 'GRUHAKALPA';

  final currentStep = 0.obs;

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  late final GlobalKey<FormBuilderState> formKey;
  late final GlobalKey<FormBuilderState> formKeyContactDetails;
  late final GlobalKey<FormBuilderState> formKeyNomineeDetails;

  RxList<MemberFormModel> memberFormDetails = <MemberFormModel>[].obs;

  Rx<Uint8List?> _imageBytes = Rx<Uint8List?>(null);
  Rx<Uint8List?> get imageBytes => _imageBytes;
  set imageBytes(Rx<Uint8List?> value) => _imageBytes = value;

  late TextEditingController AADHAR_NOController;
  late TextEditingController MEMBERSHIPIDController;
  late TextEditingController NAMEController;
  late TextEditingController dobController;
  late TextEditingController FATHER_HUSBAND_NAMEController;
  late TextEditingController BIRTH_PLACEController;

  late TextEditingController MOBILENOController;
  late TextEditingController ALTERNATE_MOBILE_NOController;
  late TextEditingController EMAILController;
  late TextEditingController ALTERNATE_EMAILController;
  late TextEditingController PERMANENT_ADDRESSController;
  late TextEditingController CORRESPONDANCE_ADDRESSController;

  late TextEditingController NOMINEE_NAMEController;
  late TextEditingController NOMINEE_MOBILEController;
  late TextEditingController NOMINEE_AGEController;
  late TextEditingController NOMINEE_RELATIONSHIPController;
  late TextEditingController NOMINEE_ADDRESSController;

  int membershipIdForEdit = 0;

  var dbMemberValues = null;

  void setImageBytes(Uint8List? bytes) {
    _imageBytes.value = bytes;
  }

  // works for Desktop only.
  // void pickImage() {
  //   print('Inside Pick Image');
  //   final html.FileUploadInputElement uploadInput =
  //       html.FileUploadInputElement();
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final files = uploadInput.files;
  //     if (files?.isNotEmpty ?? false) {
  //       final reader = html.FileReader();
  //       reader.readAsArrayBuffer(files![0]);
  //       reader.onLoadEnd.listen((loadEndEvent) {
  //         _imageBytes.value = Uint8List.fromList(reader.result as List<int>);
  //         final dynamic result = reader.result;

  //         if (result != null && result is List<int>) {
  //           _imageBytes.value = Uint8List.fromList(result);
  //         } else {
  //           print('Error: Unable to convert FileReader result to Uint8List');
  //         }
  //       });
  //     }
  //   });
  // }

  // picImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   //if (pickedFile == null) return;

  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //     //pickedFile.path;
  //     // selectedImageSize.value =
  //     //     ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
  //     //             .toStringAsFixed(2) +
  //     //         " Mb";
  //   } else {
  //     Get.snackbar(
  //       'Error',
  //       'No Image Selected',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  // getImage() async {
  //   print('Inside getImage');

  //   final ImagePicker _imagePicker = ImagePicker();

  //   XFile? pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     selectedImagePath = XFile(pickedFile.path);
  //     //pickedFile.path;
  //     // selectedImageSize.value =
  //     //     ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
  //     //             .toStringAsFixed(2) +
  //     //         " Mb";
  //   } else {
  //     Get.snackbar(
  //       'Error',
  //       'No Image Selected',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  changeLanguage() {
    String param1 = '';
    String param2 = '';
    // language = language == 'E' ? 'K' : 'E';

    if (language == 'E') {
      language = 'ಕ';
      param1 = 'ka';
      param2 = 'IN';
      companyName = 'ಗೃಹಕಲ್ಪ';
    } else if (language == 'ಕ') {
      language = 'E';
      param1 = 'en';
      param2 = 'US';
      companyName = 'GRUHAKALPA';
    }

    print('Change $language, $param1, $param2');
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
  //TODO: Implement HomeController

  final items = ['Home', 'About Us'];
  // final urlImages = [
  //   'images/image1.jpg',
  //   'images/image2.jpg',
  //   'images/image3.jpg',
  //   'images/image4.jpg',
  //   'images/image5.jpg',
  //   'images/1.jpeg',
  //   'images/3.jpeg',
  //   'images/4.jpeg',
  //   'images/5.jpeg'
  // ];

  final urlImages = [
    // 'web/image1.jpg',
    // 'web/image2.jpg',
    // 'web/image3.jpg',
    // 'web/image4.jpg',
    // 'web/image5.jpg',
    'web/1.jpeg',
    'web/2.jpeg',
    'web/3.jpeg',
    'web/4.jpeg'
  ];

  final carouselActiveImageIndex = 0.obs;

  // Uint8List imageBytes = ''.obs as Uint8List;

  final count = 0.obs;
  @override
  void onInit() {
    formKey = GlobalKey<FormBuilderState>();
    formKeyContactDetails = GlobalKey<FormBuilderState>();
    formKeyNomineeDetails = GlobalKey<FormBuilderState>();

    AADHAR_NOController = TextEditingController();
    NAMEController = TextEditingController();
    MEMBERSHIPIDController = TextEditingController();
    FATHER_HUSBAND_NAMEController = TextEditingController();
    dobController = TextEditingController();

    BIRTH_PLACEController = TextEditingController();

    MOBILENOController = TextEditingController();
    ALTERNATE_MOBILE_NOController = TextEditingController();
    EMAILController = TextEditingController();
    ALTERNATE_EMAILController = TextEditingController();
    PERMANENT_ADDRESSController = TextEditingController();
    CORRESPONDANCE_ADDRESSController = TextEditingController();

    NOMINEE_NAMEController = TextEditingController();
    NOMINEE_MOBILEController = TextEditingController();
    NOMINEE_AGEController = TextEditingController();
    NOMINEE_RELATIONSHIPController = TextEditingController();
    NOMINEE_ADDRESSController = TextEditingController();
    //  videoPlayerController = VideoPlayerController.asset('web/Locations.mp4');

    initializePlayer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();

    AADHAR_NOController.dispose();
    NAMEController.dispose();
    MEMBERSHIPIDController.dispose();
    FATHER_HUSBAND_NAMEController.dispose();
    dobController.dispose();
    BIRTH_PLACEController.dispose();

    MOBILENOController.dispose();
    ALTERNATE_MOBILE_NOController.dispose();
    EMAILController.dispose();
    ALTERNATE_EMAILController.dispose();
    PERMANENT_ADDRESSController.dispose();
    CORRESPONDANCE_ADDRESSController.dispose();

    NOMINEE_NAMEController.dispose();
    NOMINEE_MOBILEController.dispose();
    NOMINEE_AGEController.dispose();
    NOMINEE_RELATIONSHIPController.dispose();
    NOMINEE_ADDRESSController.dispose();

    super.onClose();
  }

  void increment() => count.value++;

  List<Widget> generateImageTiles(screenSize) {
    return urlImages
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
              width: Get.width,
              // height: 100,
            ),
          ),
        )
        .toList();
  }

  var carouselOptions = CarouselOptions(
    enlargeCenterPage: true,
    height: Get.height / 2,
    // aspectRatio: 18 / 8,
    autoPlay: true,
    // aspectRatio: 17 / 6,
    // //viewportFraction: 1, // To display single image
    // autoPlay: true,
    // autoPlayInterval: const Duration(seconds: 4),
    // enlargeCenterPage: true,
    // enlargeStrategy: CenterPageEnlargeStrategy.height,
    // pageSnapping: false,
    // autoPlayCurve: Curves.easeInOutCubicEmphasized,
    onPageChanged: (index, reason) {
      HomeController().activeIndex(index);
    },
  );

  void activeIndex(int currentIndex) {
    carouselActiveImageIndex.value = currentIndex;
  }

  Widget buildImage(String urlImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  buildMarquee() {
    return SizedBox(
      // decoration: BoxDecoration(color: Color.fromARGB(255, 69, 135, 234)),
      // padding: EdgeInsets.symmetric(horizontal: 16.0),
      //  margin: EdgeInsets.symmetric(vertical: 32.0),
      width: double.infinity,
      height: Get.height * 0.1,
      child: Marquee(
        text:
            '\t Dear Members, bookings are open for New Project. Members can visit our office for Site Visits, Applications and Payments on First come First Serve Basis. \t\t\t',
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          //letterSpacing: 2.0,
          // wordSpacing: 3.0,
        ),
      ),
    );
  }

  // sendFormValuetoAPI() async {
  //   print('Inside controller');
  //   await HomeProvider().postFormInputsToServer(imageBytes.value);
  // }

  sendToAPIForSave(formInputParameters) async {
    // print("Inside Controller");

    var response = await HomeProvider()
        .postFormInputsToServer(imageBytes.value, formInputParameters);

    // print(response["MEMBERSHIP_ID"]);
    // print(response["status"]);
    // var membershipType = 'P';

    var idWithZeros = addTrailingZeros(response["MEMBERSHIP_ID"].toString());

    // formKey.currentState!
    //     .patchValue({"MEMBERSHIPID": 'GK2024$membershipType$idWithZeros'});
    formKey.currentState!.patchValue({"MEMBERSHIPID": 'GK2024$idWithZeros'});

    //var ID =
    // await HomeProvider().postMemberFormParameters(
    //     MemberFormModel.fromJson(formInputParameters));

    // await HomeProvider()
    //     .postMemberFormParameters(formInputParameters, imageBytes);

    // print(ID.toString());
  }

  // fetchMemberDetails(phoneNo) async {
  //   print('Inside fetch $phoneNo');
  //   var response = await HomeProvider().fetchDetailsFromServer(phoneNo);

  //   //  print(response['image_url']);

  //   // imageUrlPic.value = response['image_url'];
  // }

  quickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showQuickLinkItems("QUICK LINKS",
            letterSpacing: letterSpacing0_8, fontSize: fontSize16),
        //sizedBoxHeight15,,
        showQuickLinkItems('\t\t\t>>  $home'),
        sizedBoxHeight10,
        showQuickLinkItems('\t\t\t>>  $aboutUs'),
        sizedBoxHeight10,
        showQuickLinkItems('\t\t\t>>  $contactUs'),
        sizedBoxHeight10,
        showQuickLinkItems('\t\t\t>>  $gallery'),
        sizedBoxHeight10,
        showQuickLinkItems('\t\t\t>>  $societyByLaw'),
        // sizedBoxHeight10,
        // showQuickLinkItems('\t\t\t>>  $siteAllotmentTC'),
      ],
    );
  }

  showQuickLinkItems(String text,
      {double letterSpacing = 1, double fontSize = 14}) {
    return Text(
      text,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

    // );
  }

  address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          addressHeader,
          style: TextStyle(
              fontSize: fontSize16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: letterSpacing0_8),
        ),
        // horizontalDivider,
        //sizedBoxHeight15,,
        Text(
          "\t\t\t The GruhaKalpa \n \t\t\tHousing Co-operative Society Ltd.",
          style: TextStyle(
            fontSize: fontSize16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(
          '\t\t\t\t\t $address1stLine',
          style: TextStyle(
            fontSize: fontSize14,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            // letterSpacing: 1,
          ),
        ),
        Text(
          '\t\t\t\t\t $address2ndLine',
          style: TextStyle(
            fontSize: fontSize14,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            // letterSpacing: 1,
          ),
        ),
        Text(
          '\t\t\t\t\t $address3rdLine',
          style: TextStyle(
            fontSize: fontSize14,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            //  letterSpacing: 1,
          ),
        ),
        Text(
          '\t\t\t\t\t $address4thLine',
          style: TextStyle(
            fontSize: fontSize14,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            // letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  socialMediaLinks() {
    return Column(
      children: [
        Text(
          followUsOn,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Wrap(
          alignment: WrapAlignment.start,
          children: [
            IconButton(
              onPressed: null,
              iconSize: 32,
              icon: Icon(
                Icons.facebook,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.mail_sharp,
                color: Colors.black,
              ),
              iconSize: 32,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.red,
              ),
              iconSize: 32,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.whatshot,
                color: Colors.red,
              ),
              iconSize: 32,
            ),
          ],
        ),
      ],
    );
  }

  contactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactDetailsHeader,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: letterSpacing0_8,
            color: Colors.black,
          ),
        ),
        sizedBoxHeight10,
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            const Icon(
              Icons.call,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Phone No. $landlineNo ",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ],
        ),
        sizedBoxHeight10,
        Wrap(
          children: [
            const Icon(Icons.phone_android_sharp, size: 18),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Mobile No. $phoneNo   ",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            Text(
              "\t\t\t\t\t Mobile No. $phoneNo1  ",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ],
        ),
      ],
    );
  }

  // Fetch Details from Server, GET API Call
  Future<void> fetchMemberDetails(phoneNo) async {
    String baseUrl = '${apiBaseUrl}memberdetails';

    final Uri url = Uri.parse('$baseUrl?param1=$phoneNo');

    try {
      final http.Response response = await http.get(url);

      // print(response.statusCode);

      // No Data Found
      if (response.statusCode == 404) {
        var res = jsonDecode(response.body);
        final String notFound = res['message'];
        print(notFound);
      }

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        final String base64ImageData = res['image_url'].toString();
        final Uint8List imageBytes = base64Decode(base64ImageData);

        setImageBytes(imageBytes);

        // Currently Not in Use
        // memberFormDetails.value =
        //     MemberFormModel().toModelFromAPIJson(res['dbValues']);

        dbMemberValues = res['dbValues'][0];

        // print(dbMemberValues);

        // For Fetching from PhoneNumber working
        DateTime dateTime = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'")
            .parse(res['dbValues'][0]['DOB']);
        DateTime formattedDateMo =
            DateTime(dateTime.year, dateTime.month, dateTime.day);
        // print(formattedDate);

        if (formKey.currentState == null &&
            formKeyContactDetails.currentState == null &&
            formKeyNomineeDetails.currentState == null) {
          AADHAR_NOController.text = dbMemberValues['AADHAR_NO'].toString();

          membershipIdForEdit = dbMemberValues['MEMBERSHIPID'];
          var idWithZeros1 =
              addTrailingZeros(dbMemberValues['MEMBERSHIPID'].toString());
          MEMBERSHIPIDController.text = 'GK2024P$idWithZeros1';
          NAMEController.text = dbMemberValues['NAME'].toString();

          DateTime parsedDate = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'")
              .parse(dbMemberValues['DOB']);
          String formattedDate = DateFormat("MM/dd/yyyy").format(parsedDate);

          // print(formattedDate);
          // DateFormat apiDateFormat =
          //     DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");
          // DateFormat desiredDateFormat = DateFormat("MM/dd/yyyy");

          // DateTime parsedDate = apiDateFormat.parse(dbMemberValues['DOB']);
          // String formattedDate = desiredDateFormat.format(parsedDate);

          // // Set the initial value for the text editing controller
          // dobController.text = formattedDate;

          // DateTime parsedDate = parseDateString(dbMemberValues['DOB']);
          // Format the parsed date as "MM/dd/yyyy"
          // String formattedDate = DateFormat("MM/dd/yyyy").format(parsedDate);
          // Set the initial value for the text editing controller
          // dobController.text = formattedDate;

          // dobController.text = DateFormat('MM/dd/yyyy').format(formattedDate);

          // dobController.text = DateFormat("E, dd MMM yyyy HH:mm:ss 'GMT'")
          //     // dobController.text = DateFormat("M/d/yyyy")
          //     .parse(res['dbValues'][0]['DOB'])
          //     .toString();

          // "${formattedDate.month}/${formattedDate.day}/${formattedDate.year}";

          // print('Date bagge');
          // print(DateFormat('MM/dd/yyyy HH:mm:ss').format(formattedDate));
          // print(dobController.text);

          FATHER_HUSBAND_NAMEController.text =
              dbMemberValues['FATHER_HUSBAND_NAME'].toString();
          dobController.text =
              "${formattedDateMo.month}/${formattedDateMo.day}/${formattedDateMo.year}";
          BIRTH_PLACEController.text = dbMemberValues['BIRTH_PLACE'].toString();

          MOBILENOController.text = dbMemberValues['MOBILENO'].toString();
          ALTERNATE_MOBILE_NOController.text =
              dbMemberValues['ALTERNATE_MOBILE_NO'].toString();
          EMAILController.text = dbMemberValues['EMAIL'].toString();
          ALTERNATE_EMAILController.text =
              dbMemberValues['ALTERNATE_EMAIL'].toString();
          PERMANENT_ADDRESSController.text =
              dbMemberValues['PERMANENT_ADDRESS'].toString();
          CORRESPONDANCE_ADDRESSController.text =
              dbMemberValues['CORRESPONDANCE_ADDRESS'].toString();

          NOMINEE_NAMEController.text =
              dbMemberValues['NOMINEE_NAME'].toString();
          NOMINEE_MOBILEController.text =
              dbMemberValues['NOMINEE_MOBILE'].toString();
          NOMINEE_AGEController.text = dbMemberValues['NOMINEE_AGE'].toString();
          NOMINEE_RELATIONSHIPController.text =
              dbMemberValues['NOMINEE_RELATIONSHIP'].toString();
          NOMINEE_ADDRESSController.text =
              dbMemberValues['NOMINEE_ADDRESS'].toString();
        }
        // MEMBERSHIPIDController.text = ;

        // print(res['dbValues'][0]);
        // print(res['dbValues'][0]['MOBILENO']);
        // print(res['dbValues'][0]['MOBILENO'].runtimeType);

        // print(res['dbValues'][0]['DOB']);
        // print(res['dbValues'][0]['DOB'].runtimeType);

        // DateTime dateTime =
        //     inputFormat.parse(res['dbValues'][0]['DOB'].toString());

        // // Format the date to "dd/mm/yyyy" format
        // String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // print(formattedDate);

        // Output: 1990-03-08

        // DateTime date = inputFormat.parse(res['dbValues'][0]['DOB']);
        // String formattedDate = DateFormat('dd/MM/yyyy').format(date);
        // print(formattedDate); // Output: 08/03/1990

        final otpController = Get.find<OtpController>();

        // print('B4 OTP controller');

        // for comparing entered mobile number with DB Mobile Number
        otpController
            .setDbMobileNumber(res['dbValues'][0]['MOBILENO'].toString());

        // print('After OTP controller');

        if (formKey.currentState != null &&
            formKeyContactDetails.currentState != null &&
            formKeyNomineeDetails.currentState != null) {
          dbMemberValues.forEach(
            (key, value) {
              if (key == 'MEMBERSHIPID') {
                membershipIdForEdit = value;
                var idWithZeros = addTrailingZeros(value.toString());

                // formKey.currentState!.fields['MEMBERSHIPID']!
                //     .didChange('GK2024P$idWithZeros');

                // if (formKey.currentState != null) {
                //   formKey.currentState!.patchValue({key: 'GK2024P$idWithZeros'});
                //   print('Error:  currentState is OK');
                // } else {
                //   print('Error: formKey or its currentState is null.');
                // }

                formKey.currentState!.patchValue({key: 'GK2024P$idWithZeros'});
              } else if (key == 'DOB') {
                formKey.currentState!.patchValue({key: formattedDateMo});
              } else {
                formKey.currentState!.patchValue({key: value.toString()});
                formKeyContactDetails.currentState!
                    .patchValue({key: value.toString()});
                formKeyNomineeDetails.currentState!
                    .patchValue({key: value.toString()});
              }
            },
          );
        }

        // print(memberFormDetails[0].EMAIL);
        // print(dbMemberValues);
      } else {
        print(
            'Failed to fetch data with image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Catch Error inside Fetch Member Details: $error');
    }
  }

  memberDetailsEdit(formInputParameters) async {
    // formInputParameters['MEMBERSHIPID'] = membershipIdForEdit;

    // formKey.currentState!
    //     .patchValue({'MEMBERSHIPID': membershipIdForEdit.toString()});
    await HomeProvider().sendEditedToServer(
        imageBytes.value, formInputParameters, membershipIdForEdit);

    // print('member Details Edit ');
  }

  Future<void> initializePlayer() async {
    //https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4
    String url =
        'https://firebasestorage.googleapis.com/v0/b/housingsociety-29ed9.appspot.com/o/LocationsVideo.mp4?alt=media&token=279509c1-9d74-409e-9958-f15589bee3bf';

    // Working
    // 'https://firebasestorage.googleapis.com/v0/b/housingsociety-29ed9.appspot.com/o/desk.mp4?alt=media&token=d3c0a4fa-6c66-4e6c-b57a-d32bd0126d24';
    // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';

    // 'https://drive.google.com/uc?export=download&id=1WwcuRqGZkh1i0zsMLWj0cPthP-77jCWO/Locations.mp4';
    // 'https://drive.google.com/file/d/1WwcuRqGZkh1i0zsMLWj0cPthP-77jCWO/view?usp=sharing';

    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );
    // videoPlayerController = VideoPlayerController.networkUrl(
    //   Uri.parse(url),
    // );

    // videoPlayerController = VideoPlayerController.asset('web/Locations.mp4');
    await Future.wait([videoPlayerController.initialize()]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      // autoPlay: true,
      // looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.cyanAccent,
        backgroundColor: Colors.yellow,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.redAccent,
      ),
      autoInitialize: true,
    );

    update();
  }

  void changeStep(int newStep) {
    // if (_formKey.currentState!.validate()) {
    // Validate current step before moving
    currentStep.value = newStep;
    // }
  }
}

addTrailingZeros(String numberString) {
  // Determine the number of trailing zeros needed
  int numberOfZeros =
      4 - numberString.length; // Adjust the total length as needed

  // Add trailing zeros
  String numberWithZeros = '0' * numberOfZeros + numberString;

  return numberWithZeros;
}
