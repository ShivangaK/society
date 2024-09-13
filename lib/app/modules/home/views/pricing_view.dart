// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';

class PricingView extends GetView {
  const PricingView({Key? key}) : super(key: key);

  static const IconData currency_rupee =
      IconData(0xf04e1, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackgroundColor,
      appBar: myAppBarDesktop,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.1,
          vertical: Get.height * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconData(0xf04e1, fontFamily: 'MaterialIcons'),
                    color: Colors.black,
                    size: 32.0,
                  ),
                  Divider(
                    height: 6,
                    thickness: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.redAccent,
                  ),
                  // Spacer(),
                  Text(
                    "Pricing",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Text(
              'Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome to our pricing policy. We are committed to providing you with competitive and transparent pricing for our products and services.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pricing Structure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. Product/Service Pricing:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\t\t\t \u2022 All prices are listed in Indian Rupees.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '\t\t\t \u2022 Prices are inclusive of all applicable taxes.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '\t\t\t \u2022 We reserve the right to update our prices as needed, but any changes will be communicated in advance.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '2. Discounts and Promotions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\t\t\t \u2022 We may offer discounts or promotions from time to time.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '\t\t\t \u2022 The terms and conditions of any discounts or promotions will be clearly communicated during the offer period.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. Payment Methods:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\t\t\t \u2022 We accept payments through UPI,Net Banking etc. .',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '\t\t\t \u2022 All payments are processed securely.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
