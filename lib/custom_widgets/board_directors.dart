import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/custom_widgets/circular_profile_avatar.dart';

class BoardOfDirectors extends StatelessWidget {
  const BoardOfDirectors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Photo
        const CircularProfile(),

        sizedBoxHeight10,
        // Name
        Container(
          width: Get.width / 7,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Text(
            'Umesha U.S',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
        ),
        sizedBoxHeight10,
        // Secretary
        Container(
          width: Get.width / 7,
          // padding: EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: const Text(
            'Secretary',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
        ),
        sizedBoxHeight10,
        // Designation in KPCL
        Container(
          width: Get.width / 7,
          // padding: EdgeInsets.symmetric(vertical: 16.0),
          alignment: Alignment.center,
          child: const Text(
            'Assistant Engineer - KPCL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
        ),
        sizedBoxHeight10,
        SizedBox(
          width: Get.width / 7,
          child: const Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.facebook),
              Icon(Icons.youtube_searched_for),
            ],
          ),
        )
      ],
    );
  }
}
