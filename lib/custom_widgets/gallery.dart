import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

// Replace with your image data source (e.g., list of image URLs)
final List<String> imageUrls = [
  // 'https://wallpaperaccess.com/full/2109063.jpg',
  'https://files.msg91.com/416655/jeeqjaby/xvefzshs',
  'https://files.msg91.com/416655/jeeqjaby/gsagwdag',
  'https://files.msg91.com/416655/jeeqjaby/faagmuyy',
  'https://files.msg91.com/416655/jeeqjaby/kdgjbxgk',
  'https://files.msg91.com/416655/jeeqjaby/tlzoapmk',
  'https://files.msg91.com/416655/jeeqjaby/zkykhbsr',
  'https://files.msg91.com/416655/jeeqjaby/bptnjyvs',
  'https://files.msg91.com/416655/jeeqjaby/pfyknqyk',
  'https://files.msg91.com/416655/jeeqjaby/shmsgyvi',
  'https://files.msg91.com/416655/pdwzmzfv'
];

// Replace with corresponding two-word descriptions
final List<String> imageDescriptions = [
  // 'Image Description 1',
  'As a culture | \nSeeking Divine Blessings',
  'Devi\'s Grace',
  'Project Launch ',
  'Member\'s Participation',
  'Keeping Up the Promise | \nOffer Letter Delivered',
  'Executive Director RTPS | Offer Letter',
  'Deputy General Manager Finance, RTPS |\nOffer Letter Received',
  'Deputy Gen. Manager Chemical, RTPS |\nOffer Letter Received',
  'Happy Customer |\nBooking Confirmation Letter Received',
  'Location'
];

class ResponsiveImageWithDescription extends StatelessWidget {
  final int index;

  const ResponsiveImageWithDescription(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: Get.width < 500 ? Get.width - 16 : Get.width - 400,
            height: Get.width < 500 ? Get.height / 1.5 : 600,
            child: CachedNetworkImage(
              imageUrl: imageUrls[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => const Column(
                children: [
                  Text('Loading...'),
                  CircularProgressIndicator(),
                ],
              ),
              errorWidget: (context, url, error) => const Column(
                children: [
                  Text('Error Loading the Image..'),
                  Icon(
                    Icons.error,
                    size: 100.0,
                  ),
                ],
              ),
              // Ensure image covers container
            ),
          ),
        ),
        Positioned(
          bottom: Get.width < 500
              ? MediaQuery.of(context).size.height * 0.02
              : null, // Adjust top padding responsively
          top: Get.width > 1100
              ? MediaQuery.of(context).size.height * 0.02
              : null,
          left: MediaQuery.of(context).size.width *
              0.02, // Adjust left padding responsively
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Get.width < 500
                  ? Colors.white.withOpacity(0.36)
                  : Colors.amber.shade300.withOpacity(0.7),
            ),
            alignment: Alignment.center,
            // Adjust background color
            padding: Get.width < 500
                ? const EdgeInsets.all(4.0)
                : const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 8.0), // Adjust padding
            child: Text(
              textAlign: TextAlign.center,
              imageDescriptions[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust text style
                fontSize: 16.0 *
                    MediaQuery.of(context)
                        .textScaler
                        .scale(1), // Adjust font size responsively
              ),
            ),
          ),
        ),
      ],
    );
  }
}
