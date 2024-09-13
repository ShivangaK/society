import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HousingHero extends StatelessWidget {
  // final String imageAsset; // Path to your background image asset
  // final String title; // Title text for the housing society

  const HousingHero({
    super.key,
    // required this.imageAsset, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            // child:
            // CircularProfileAvatar(
            // 'web/HeroImage.jpg',
            // radius: 240.0,
            // borderWidth: 2.0,
            // borderColor: Colors.orange,

            child: Image.network(
              alignment: Alignment.centerRight,
              height: Get.height / 1.8,
              width: Get.width / 2,
              'https://files.msg91.com/416655/nyzofqyl',
              // 'web/HeroImage.jpg',
              fit: BoxFit.contain,
            ),
            // ),
          ),
          const SizedBox(
            width: 120,
          ),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to \n ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      TextSpan(
                        text: 'GRUHAKALPA \n',
                        style: TextStyle(
                          fontSize: 56.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Housing Co-operative Society \n\n ',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      TextSpan(
                        text: 'Start Building Your Future\n\n',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Buy Genuine Plots at Unbeatable Prices in Bengaluru',
                        style: TextStyle(
                            fontSize: 12.0, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton.icon(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(
                        6.0), // Set elevation for all states
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 18.0)), // Set padding for all states

                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.shade900),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mobile_friendly,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Call us Now',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Hero(
    //   tag: title, // Use title as unique identifier for Hero animation
    //   child: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage(imageAsset),
    //         fit: BoxFit.contain, // Ensure image covers the container
    //       ),
    //     ),
    //     child: Center(child: adaptTextSize(context)),
    //   ),
    // );
  }

  // FittedBox adaptTextSize(BuildContext context) {
  //   return FittedBox(
  //     fit: BoxFit.scaleDown, // Scale down text to fit within container
  //     child: Text(
  //       title,
  //       style: const TextStyle(
  //         fontSize: 34,
  //         color: Colors.blue,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }
}
