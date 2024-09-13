import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AmenitiesWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const AmenitiesWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      // height: 140,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300, // Border color
          width: 0.8, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) => const LinearGradient(
              colors: [Color(0xFFFD1D1D), Color(0xFFFFC371)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: FaIcon(
              icon,
              size: 32.0,
              // color: Colors.blue,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Amenity {
  final IconData icon;
  final String title;

  Amenity({required this.icon, required this.title});
}
