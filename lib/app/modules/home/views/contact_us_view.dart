import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../text_constants.dart';

class ContactUsView extends GetView {
  const ContactUsView({Key? key}) : super(key: key);
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
                    Icons.contact_phone,
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
                    "Contact Us",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              'Mobile No.     $phoneNo',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Landline No.  $landlineNo',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'email              $email',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
