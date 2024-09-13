import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:society/custom_widgets/about_us.dart';
import 'package:society/text_constants.dart';

import '../../../../constants.dart';

class AboutusView extends GetView {
  const AboutusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // myDefaultBackgroundColor  = Colors.black;
    return Scaffold(
      backgroundColor: myDefaultBackgroundColor,
      appBar: myAppBarDesktop,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.1,
          vertical: Get.height * 0.1,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              child: Text(
                aboutUs,
                style: const TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
            AboutUs(
              heading: objectivesHeader,
              content: objectivesHeaderContent,
            ),
            AboutUs(
                heading: whatisCoopSociety,
                content: whatisCoopSocietyContentPara1),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: Text(
                featuresofCoopSociety,
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            AboutUs(
              heading: voluntaryMembershipHeading,
              content: voluntaryMembershipContent,
            ),
            AboutUs(
              heading: legalStatusHeader,
              content: legalStatusContent,
            ),
            AboutUs(
              heading: limitedLiabilityHeader,
              content: limitedLiabilityContent,
            ),
            AboutUs(
              heading: controlHeader,
              content: controlContent,
            ),
            AboutUs(
              heading: serviceMotiveHeader,
              content: serviceMotiveContent,
            ),
          ],
        ),
      ),
    );
  }
}
