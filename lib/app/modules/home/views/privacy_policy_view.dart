import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';

class PrivacyPolicyView extends GetView {
  const PrivacyPolicyView({Key? key}) : super(key: key);
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
                    Icons.privacy_tip,
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
                    "Privacy Policy",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Text(
              '1. Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''This Privacy Policy outlines the types of personal information we collect, how we use and protect this information, and your choices regarding the collection and use of your data.

By using our website, you agree to the terms outlined in this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not access or use our website.''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '2.1 Personal Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
We may collect personal information directly from you, such as your name, email address, and other contact details, when you interact with our website, subscribe to our newsletter, or use our services.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '2.2 Automatically Collected Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
We may automatically collect information about your device and how you interact with our website. This information may include your IP address, browser type, device identifiers, and pages visited''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),
            const Text(
              '3. Use of Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '3.1 How We Use Your Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
We use the collected information for various purposes, including:

\u2022 Providing and improving our services
\u2022 Sending newsletters or promotional materials
\u2022 Analyzing website usage and performance
\u2022 Personalizing user experience
\u2022 Responding to user inquiries or requests''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '3.2 Sharing of Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except as outlined in this Privacy Policy or as required by law.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),
            const Text(
              '3.3 Security',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
We implement reasonable security measures to protect your personal information. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.''',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
