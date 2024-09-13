import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:society/constants.dart';

class PaymentDetailsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  //Post Call to API, to Save Form Data
  Future postFormInputsToServer(
      formInputParameters, memberName, memberPhone) async {
    // print('Inside Provider Payment Details ');

    // Replace the URL with your server endpoint
    String url = '${apiBaseUrl}paymentdetails';

    try {
      // Create the request body
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> requestBody = {
        "formInputs": formInputParameters,
        "name": memberName,
        "phone": memberPhone
      };

      // Convert the request body to JSON
      String jsonBody = jsonEncode(requestBody);

      // Send the HTTP POST request
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      // print(response.body);
      // Check the response status
      if (response.statusCode == 200) {
        // print(response);
        // print('Payment Details uploaded successfully ${response.body}');
        var res = jsonDecode(response.body);
        return res;
        // return jsonDecode(response.body['MEMBERSHIP_ID']);
      } else {
        print('Failed to upload Payment Details. Status code: ');
        // var res = jsonDecode(response.body);
        // return res;
      }
    } catch (error) {
      print('Error  Inside Payment Details Provider: $error');
    }
  }

  //Post Call to API, to Save Edited Form Data
  Future postEditFormInputsToServer(
      formInputParameters, memberName, memberPhone) async {
    // print('Inside Provider Payment Details ');

    // Replace the URL with your server endpoint
    String url = '${apiBaseUrl}paymentdetails';

    try {
      // Create the request body
      Map<String, String> headers = {"Content-type": "application/json"};
      Map<String, dynamic> requestBody = {
        "formInputs": formInputParameters,
        "name": memberName,
        "phone": memberPhone
      };

      // Convert the request body to JSON
      String jsonBody = jsonEncode(requestBody);

      // Send the HTTP PUT request
      http.Response response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      print(response.body);
      // Check the response status
      if (response.statusCode == 200) {
        // print(response);
        // print('Payment Details uploaded successfully ${response.body}');
        var res = jsonDecode(response.body);
        return res;
        // return jsonDecode(response.body['MEMBERSHIP_ID']);
      } else {
        print('Failed to upload Payment Details. Status code: ');
        // var res = jsonDecode(response.body);
        // return res;
      }
    } catch (error) {
      print('Error  Inside Payment Details Provider: $error');
    }
  }

//  Get API call to fetch Member Phone Number and Name
//  Flag = 1, fetch all payments details of the Member
//  Flag = 2, fetch single payment[transaction] Details of the Member

  Future fetchmemberNameandPhone(memberId, tranid, [String? flag]) async {
    // print('Inside Provider Payment Details, fetchmemberNamePhone ');

    // Replace the URL with your server endpoint
    String baseUrl = '${apiBaseUrl}paymentdetails';

    // Define your parameters
    var parameters = {
      'memberID': memberId,
      'flag': flag,
      'transactionid': tranid,
      // 'param2': 'value2',
    };

    // print(parameters);
    final Uri url = Uri.parse(baseUrl).replace(queryParameters: parameters);

    try {
      final http.Response response = await http.get(url);

      // print(response);

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body['Transactions']));
        var res = jsonDecode(response.body);
        // print('Inside Get fetchmemberNamePhone  ');

        return res;
      } else {
        //Unable to Connect to DB
        print('Inside Get fetchmemberNamePhone Not Connected to DB ');
        return 0;
      }

      // print(response.statusCode);
    } catch (error) {
      print(
          'Catch Error Inside Provider Payment Details, fetchmemberNamePhone: $error');
      return 0;
    }
  }
}
