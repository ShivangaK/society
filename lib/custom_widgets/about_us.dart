import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:society/color_constants.dart';

class AboutUs extends StatelessWidget {
  final String? heading;
  final String content;

  AboutUs({
    super.key,
    this.heading,
    required this.content,
  });

  final headingFonts = GoogleFonts.lato(
    color: black,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  final contentFonts = GoogleFonts.lato(
    color: black,
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: Get.width,
      child: ListTile(
        title: Text(heading!, textAlign: TextAlign.start, style: headingFonts),
        subtitle: Text(
          content,
          textAlign: TextAlign.justify,
          style: contentFonts,
        ),
        isThreeLine: true,
      ),
    );
  }
}
