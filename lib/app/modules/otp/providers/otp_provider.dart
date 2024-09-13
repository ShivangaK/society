import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../controllers/otp_controller.dart';

class OtpProvider extends GetConnect {
// final OtpController = Get.find<OtpController>();
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future getOTP(String userMobileNo) async {
    // print('Inside getOTP');

    // const String baseUrl = 'http://117.192.9.195:5050/generate_otp';

    String baseUrl = '${apiBaseUrl}generate_otp';

    // Define your parameters
    var parameters = {
      'phoneNo': userMobileNo,
      // 'param2': 'value2',
    };

    final Uri url = Uri.parse(baseUrl).replace(queryParameters: parameters);

    try {
      final http.Response response = await http.get(url);
      final otpController = Get.find<OtpController>();

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);

        // print('Inside Get OTP $res');
        otpController.secretKey = res['secret'];
        otpController.otpFromAPI = res['otp'];
        // print(otpController.secretKey);
        // print(otpController.otpFromAPI);
      }

      // print(response.statusCode);
    } catch (error) {
      print('Catch Error: $error');
    }
  }

  Future postOTP() async {
    final otpController = Get.find<OtpController>();
    // print(
    //     'Inside postOTP ${otpController.secretKey} ${otpController.otpFromAPI}');

    String baseUrl = '${apiBaseUrl}verify_otp';

    // final Uri url = Uri.parse(baseUrl);

    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> requestBody = {
        "secret": otpController.secretKey,
        "otp": otpController.otpFromAPI,
      };

      // Convert the request body to JSON
      String jsonBody = jsonEncode(requestBody);

      // print(jsonBody);

      // Send the HTTP POST request
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        var res = jsonDecode(response.body);

        print('Inside Get OTP');
      } else {
        print('Inside Get OTP Else part');
      }
    } catch (error) {
      print('Catch Error in Verify OTP Post Call: $error');
    }
  }
}
