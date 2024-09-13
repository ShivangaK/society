import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';

class CancelRefundPolicyView extends GetView {
  const CancelRefundPolicyView({Key? key}) : super(key: key);
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
                    Icons.cancel_presentation_rounded,
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
                    "Refund/Cancellation Policy",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Text(
              '1. Refund Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''Refund policies vary depending on the type of product or service. Details regarding refunds are provided in the respective product or service documentation. ''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '2. Cancellation Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            const Text(
              '''
Customers may cancel subscriptions or services by following the outlined cancellation process. Cancellation terms and any associated fees are detailed in the product or service agreement.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '3. Refund Process',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            const Text(
              '''
To request a refund, please contact our customer support team at contact@gruhakalpahousingsociety.in . Provide Your name and contact information, Order number or transaction ID and Reason for the refund request.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
Once your request is received and approved, we will process the refund within 5 working days. Refunds will be issued using the original payment method, unless otherwise specified.''',
              style: TextStyle(
                fontSize: 16,
              ),
            )

            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
