import 'package:flutter/material.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      shadowColor: Colors.black,
      elevation: 10.0, // Adjust this value to control the elevation
      shape: CircleBorder(),
      child: CircleAvatar(
        radius: 120.0,
        backgroundImage: AssetImage('images/shiv.png'),
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.redAccent,
    //         spreadRadius: 2,
    //         blurRadius: 5,
    //         offset: Offset(0, 3),
    //       ),
    //     ],
    //   ),
    //   child: CircleAvatar(
    //     radius: 80.0,
    //     backgroundImage: AssetImage('images/shiv.png'),
    //   ),
    // );

    // ;
    // Center(
    //   child: CircleAvatar(
    //     radius: 110,
    //     child: CircleAvatar(
    //       radius: 105.0,
    //       // backgroundColor: Colors.redAccent,
    //       backgroundImage: AssetImage(
    //         'images/shiv.png',
    //         // width: 100.0, // Set the desired width for your circular image
    //         // height: 160.0, // Set the desired height for your circular image
    //         // fit:                BoxFit.cover, // Adjust the image to cover the circular boundary
    //       ),
    //     ),
    //   ),
    // );
    // ;
    // const ClipOval(
    //   child: Card(
    //     elevation: 5.0,
    //     child: CircleAvatar(
    //       backgroundColor: Colors.redAccent,
    //       radius: 105,
    //       child: CircleAvatar(
    //         backgroundColor: Colors.transparent,
    //         radius: 100,
    //         backgroundImage: AssetImage('images/shiv.png'),
    //         // child: Image.asset(
    //         //   'images/shiv.png',
    //         //   fit: BoxFit.contain,
    //         // ),
    //       ),
    //     ),
    //   ),
    // );
    //     SizedBox(
    //   height: 300,
    //   width: 300,
    //   child: CircularProfileAvatar(
    //     'images/shiv.png', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
    //     radius: 120, // sets radius, default 50.0
    //     backgroundColor:
    //         Colors.transparent, // sets background color, default Colors.white
    //     //   borderWidth: 5, // sets border, default 0.0
    //     // initialsText: const Text(
    //     //   "AD",
    //     //   style: TextStyle(fontSize: 40, color: Colors.white),
    //     // ), // sets initials text, set your own style, default Text('')
    //     //  borderColor: Colors.brown, // sets border color, default Colors.white
    //     elevation:
    //         5.0, // sets elevation (shadow of the profile picture), default value is 0.0
    //     // foregroundColor: Colors.brown.withOpacity(
    //     //     0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
    //     cacheImage: true, // allow widget to cache image against provided url
    //     imageFit: BoxFit.cover,
    //     // onTap: () {
    //     //   print('adil');
    //     // }, // sets on tap
    //     // showInitialTextAbovePicture:
    //     //     true, // setting it true will show initials text above profile picture, default false
    //   ),
    // );
  }
}
