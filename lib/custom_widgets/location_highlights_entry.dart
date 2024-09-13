import 'package:flutter/material.dart';
import 'package:society/constants.dart';

class LocationHighlightsEntry extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final String publisher;

  const LocationHighlightsEntry({
    Key? key,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  // textAlign: TextAlign.justify,
                ),
                sizedBoxHeight10,
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    publisher,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                sizedBoxHeight10,
                const Divider(),
                sizedBoxHeight10,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
