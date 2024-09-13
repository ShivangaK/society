import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants.dart';

class TermsConditionsView extends GetView {
  const TermsConditionsView({Key? key}) : super(key: key);
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
                    Icons.line_style_rounded,
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
                    "Terms and Conditions",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Text(
              '1. Membership Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '''
\u2022 	Member shall be governed by the Bye-law of society, rules and regulations framed by the board periodically.
\u2022	The board may reject any application without any reason.
\u2022 	Board shall reserve the right of member’s admission to society.
\u2022 	Member shall visit the society periodically, update the addresses, and telephone number. Non-receipt of communication shall not be considered as a valid reason for delayed payments

''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '2. Site Allotment Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            const Text(
              '''
\u2022	I agree to abide by the conditions of allotment and sale of site as prescribed by the Gruhakalpa Housing Co- operative Society Ltd.
\u2022	I hereby declare that all the above information furnished by me is true to the best of my knowledge. I shall furnish any other information that may be required with regard to allotment of site.
\u2022	If I not furnish such other information required within time, it will be the discretion power of the Gruhakalpa Housing Co-operative Society Ltd. for allotment of the site.
\u2022	In case it is found that the information and declaration furnished by me is found to be false at any time, the Society shall have the right to cancel the allotment made to me and fully understand that ever at a future date, I cannot have any claim.
\u2022	My application for allotment of site in the society is subject to approval of Membership/Associate Membership by the society is subject and clearance of land by approving authority and subject to availability of site.
\u2022	Membership of the Society shall not confirm entitlement for allotment of Site. Seniority for allotment of Site shall be based on the Payment or Initial deposit as well as subsequent instalment.
\u2022	I fully agree upon the above conditions and it is binding on me.
''',
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
