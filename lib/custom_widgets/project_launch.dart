import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/custom_widgets/bottom_sheet.dart';
import 'package:society/custom_widgets/location_highlights_entry.dart';

class NewProjectLaunch extends StatelessWidget {
  const NewProjectLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '🎉 Exciting News! 🎉',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Introducing Power City Phase 1!',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: boxDecoration(),
                      child: listTile(Icons.flight_takeoff_outlined,
                          'Devanahalli', 'Location'),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: boxDecoration(),
                      child: listTile(
                          Icons.architecture_sharp, '10 Acres', 'Area'),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: boxDecoration(),
                      child: listTile(Icons.check_circle_outline_sharp,
                          'BIAAPA Approval', 'A Khaata'),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: boxDecoration(),
                      child: listTile(
                          Icons.currency_rupee, '2,500 per Sq.ft.', 'Cost'),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          Container(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            alignment: Alignment.center,
            child: const Text(
              'Location Highlights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            // height: 6,
            thickness: 2,
            color: Colors.green[900],
            indent: 114,
            endIndent: 100,
          ),
          const SizedBox(height: 40.0),
          Material(
            elevation: 8.0, // Adjust for desired elevation
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: 100,
              child: AnimatedTextKit(
                pause: const Duration(milliseconds: 1),
                repeatForever: true,
                animatedTexts: [
                  RotateAnimatedText(
                    '✈️',
                    textStyle: const TextStyle(
                      fontSize: 100.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '20 Mins.',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'TO',
                  style: TextStyle(
                    fontSize: 12.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'KEMPEGOWDA INTERNATIONAL AIRPORT',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60.0),
          const LocationHighlightsEntry(
            icon: Icons.water_drop_rounded,
            title: 'CAUVERY WATER ',
            subtitle:
                'BWSSB plans to expand Cauvery water  to Devanahalli, under Stage VI',
            publisher: '-- Deccan Herald',
          ),
          const SizedBox(height: 30.0),
          const LocationHighlightsEntry(
            icon: Icons.train,
            title: 'NAMMA METRO ',
            subtitle:
                'BMRCL plans, Namma Metro expansion to Devanahalli,covering approximately 15KM in north Bengaluru.',
            publisher: '-- The Hindu',
          ),
          const SizedBox(height: 30.0),
          const LocationHighlightsEntry(
            icon: Icons.school_sharp,
            title: 'SCHOOLS & COLLEGES',
            subtitle:
                'AKASH International, STONEHILL International, OXFORD English School, Cambridge Institute of Tech., Sir MVIT, NMIT  ',
            publisher: '.. and many more',
          ),
          const SizedBox(height: 30.0),
          const LocationHighlightsEntry(
            icon: Icons.food_bank,
            title: 'HOTELS & RESTAURANTS',
            subtitle:
                'Taj Bangalore, Signature Club Resort, JW Marriott, Prestige Golfshire  ',
            publisher: '.. and many more',
          ),
          const SizedBox(height: 30.0),
          const LocationHighlightsEntry(
            icon: Icons.local_hospital,
            title: 'HOSPITALS & HEALTH CARE',
            subtitle:
                'Akash Hospital,Manipal Hospital, Leena Multispeciality Hospital ',
            publisher: '.. and many more',
          ),
          const SizedBox(height: 30.0),
          const LocationHighlightsEntry(
            icon: Icons.location_city_sharp,
            title: 'BUSINESS PARKS',
            subtitle: 'Devanahalli Business Park, Foxconn (iPhone) ',
            publisher: '.. and many more to come',
          ),
          const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            alignment: Alignment.center,
            child: const Text(
              'PREMIUM AMENITIES',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline,
                // decorationColor: Colors.red,
              ),
            ),
          ),
          Divider(
            // height: 6,
            thickness: 2,
            color: Colors.green[900],
            indent: 114,
            endIndent: 100,
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    amenities(FontAwesomeIcons.archway),
                    sizedBoxHeight10,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'GRAND ENTRANCE ARCH ',

                        // style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    amenities(FontAwesomeIcons.cloudShowersHeavy),
                    sizedBoxHeight10,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'RAIN WATER HARVESTING',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    amenities(FontAwesomeIcons.children),
                    sizedBoxHeight10,
                    const Text(
                      'KIDS PLAY AREA',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    amenities(FontAwesomeIcons.road),
                    sizedBoxHeight10,
                    const Text(
                      'PEDESTRIAN PATHWAY ',
                      // style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    amenities(FontAwesomeIcons.cableCar),
                    sizedBoxHeight10,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        'LED STREET LIGHTS',
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    amenities(Icons.factory_outlined),
                    sizedBoxHeight10,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'SEWAGE TREATMENT PLANT  ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 60.0),
          ElevatedButton(
            onPressed: () {
              Get.bottomSheet(
                backgroundColor: Colors.white,
                const ContactsBottomSheet(
                  flag: 0,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              backgroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Book Your Slot Now',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  ListTile listTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
        color: Colors.black87,
      ),
      subtitle: Text(subtitle),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(44.0),
      gradient: LinearGradient(
        // Define the gradient
        begin: Alignment.centerLeft, // Starting point of the gradient
        end: Alignment.centerRight, // Ending point of the gradient
        colors: [
          Colors.orange.withOpacity(0.8),
          Colors.yellow.withOpacity(0.8),
        ], // Gradient colors
      ),
    );
  }

  Material amenities(IconData icon) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle, // Make the container circular
        ),
        child: Icon(
          icon,
          size: 50.0,
          color: Colors.amber.shade600,
        ),
      ),
    );
  }
}
