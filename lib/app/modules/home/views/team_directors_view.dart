import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:society/custom_widgets/board_directors.dart';

import '../../../../constants.dart';

class TeamDirectorsView extends GetView {
  const TeamDirectorsView({Key? key}) : super(key: key);
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
        child: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              Container(
                color: Colors.tealAccent,
                height: Get.height * 0.4,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "LEADERSHIP",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.1,
                alignment: Alignment.centerLeft,
                child: const Text("TEAM OF MEMBERS"),
              ),
              const BoardOfDirectors(),
            ],
          ),
        ),
      ),
    );
  }
}
