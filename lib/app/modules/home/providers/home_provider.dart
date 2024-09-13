import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:society/constants.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  // Future fetchDetailsFromServer(phoneNo) async {
  //   print('Inside Provider fetch $phoneNo');

  //   final String baseUrl = 'http://172.23.208.13:5050/memberdetails';

  //   final Uri url = Uri.parse('$baseUrl?param1=$phoneNo');

  //   try {
  //     final http.Response response = await http.get(url);

  //     // Check if the request was successful (status code 200)
  //     if (response.statusCode == 200) {
  //       var res = jsonDecode(response.body);
  //       print('Response: ${res["image_url"]}');

  //       // final Uint8List imageData = Uint8List.fromList(response.bodyBytes);
  //       final Uint8List imageBytes = base64Decode(res['image_url'].toString());

  //       HomeController().setImageBytes(imageBytes);

  //       // var res = jsonDecode(response.body);
  //       // return res;

  //       // Decode the response body (image bytes)
  //       // _imageBytes = response.bodyBytes;
  //     } else {
  //       print('Failed to fetch image. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  //Post Call to API, Image
  Future postFormInputsToServer(selectedUserImage, formInputParameters) async {
    // print('Inside Provider');
    if (selectedUserImage != null) {
      // Replace the URL with your server endpoint
      String url = '${apiBaseUrl}memberdetails';

      try {
        // Encode the image bytes to base64
        String base64Image = base64Encode(selectedUserImage!);

        // Create the request body
        Map<String, String> headers = {"Content-type": "application/json"};
        Map<String, dynamic> requestBody = {
          "image": base64Image,
          "formInputs": formInputParameters
        };

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
          // print('Image uploaded successfully ${response.body}');
          var res = jsonDecode(response.body);
          return res;
          // return jsonDecode(response.body['MEMBERSHIP_ID']);
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
      }
    } else {
      print('Please select an image first');
    }
  }

  // Future postMemberFormParameters(MemberFormModel memberFormParameters) async {

  // Future postMemberFormParameters(memberFormParameters, imageBytes) async {
  //   print("Inside Provider");

  //   var uri = Uri.parse(
  //       'http://172.23.208.13:5050/memberdetails'); // Replace with your API endpoint
  //   var request = http.MultipartRequest('POST', uri);

  //   memberFormParameters.forEach((key, value) {
  //     if (key != 'profilePic') {
  //       print(key);
  //       request.fields[key] = value.toString();
  //     }
  //   });
  //   // Attach the text fields to the request
  //   // request.fields['MEMBERSHIP_ID'] = memberFormParameters['MEMBERSHIP_ID'];
  //   // request.fields['MOBILE_NO'] = memberFormParameters['MOBILE_NO'];

  //   // request.fields['MEMBER_NAME'] = memberFormParameters['MEMBER_NAME'];
  //   // request.fields['EMAIL'] = memberFormParameters['EMAIL'];

  //   // Attach the image file to the request

  //   // Uint8List data = memberFormParameters['profilePic'];
  //   // List<int> list = data.cast();
  //   // var multipartFile = http.MultipartFile.fromBytes('profilePic', list,
  //   //     filename: memberFormParameters['profilePic']);
  //   // request.files.add(multipartFile);

  //   request.files.add(http.MultipartFile.fromBytes(
  //     'image',
  //     imageBytes,
  //     filename: 'shiv.jpg', // Adjust the filename as needed
  //     //contentType: MediaSou
  //     // Adjust the content type as needed
  //   ));

  //   // Send the request
  //   var response = await request.send();

  //   // Check the response
  //   if (response.statusCode == 200) {
  //     print('Data uploaded successfully');
  //   } else {
  //     print('Data upload failed with status: ${response.statusCode}');
  //   }

  //   // final response = await post('http://172.23.208.13:5050/memberdetails',
  //   //     memberFormParameters.toJson());

  //   // print(response.statusCode);
  //   // print(response.statusText);
  //   // print(response.body);
  //   // return response.body;
  // }

  Future sendEditedToServer(
      selectedUserImage, formInputParameters, membershipIdForEdit) async {
    // print('Inside Edit Provider $formInputParameters');

    if (selectedUserImage != null) {
      // Replace the URL with your server endpoint
      String url = '${apiBaseUrl}memberdetails';

      try {
        // Encode the image bytes to base64
        String base64Image = base64Encode(selectedUserImage!);

        // Create the request body
        Map<String, String> headers = {"Content-type": "application/json"};
        Map<String, dynamic> requestBody = {
          "image": base64Image,
          "formInputs": formInputParameters,
          "membershipID": membershipIdForEdit,
        };

        // Convert the request body to JSON
        String jsonBody = jsonEncode(requestBody);

        // Send the HTTP POST request
        http.Response response = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonBody,
        );

        // Check the response status
        if (response.statusCode == 200) {
          // print('Image uploaded successfully ${response.body}');
          var res = jsonDecode(response.body);
          return res;
          // return jsonDecode(response.body['MEMBERSHIP_ID']);
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error Inside Provider: $error');
      }
    }
  }
}
