import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/custom_widgets/amenities.dart';
import 'package:society/custom_widgets/gallery.dart';
import 'package:society/custom_widgets/housing_hero.dart';
import 'package:society/custom_widgets/location_highlights_entry.dart';

import '../app/modules/home/controllers/home_controller.dart';

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
  ' ',
  'Member\'s Participation',
  'Keeping Up the Promise | \nOffer Letter Delivered',
  'Executive Director RTPS | Offer Letter',
  'Deputy General Manager Finance, RTPS |\nOffer Letter Received',
  'Deputy Gen. Manager Chemical, RTPS |\nOffer Letter Received',
  'Happy Customer |\nBooking Confirmation Letter Received',
  'Location'
];

class DesktopScaffold extends GetView<HomeController> {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = controller.generateImageTiles(screenSize);

    return Scaffold(
      // floatingActionButton: IconButton(
      //   onPressed: () => Get.to(MemberForm()),
      //   icon: Icon(Icons.download),
      // ),

      //  extendBodyBehindAppBar: true,
      backgroundColor: myDefaultBackgroundColor,
      appBar: myAppBarDesktop,
      // appBar: myAppBar2,
      //drawer: myDrawer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const HousingHero(),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'A Glimpse Behind the Scenes: A Sneak Peek at Our Society\'s Beginnings',
              style: TextStyle(
                fontSize: 28.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.green[900],
              indent: 350,
              endIndent: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CarouselSlider(
                items: imageSliders,
                options: controller.carouselOptions,
              ),
            ),
            const SizedBox(
              height: 60,
            ),

            Container(
              height: 400,
              color: Colors.yellow.shade100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(left: 400),
                    child: Image.asset(
                      'web/kar_logo11.png',
                      // Ensure correct path to your PNG image
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Registered with',
                          style: TextStyle(
                              height: 3.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'Department of Co-operation',
                          style: TextStyle(
                              height: 0.0,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Govt. of Karnataka',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text('Governed by, Karnataka Co-operative Act 1959(8)'),
                        Text(
                          'Reg. No. JRB/RGN/CR-04/51586/2023-24 on 21-11-2023',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              '🎉 EXCITING NEWS 🎉',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                // letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'launching POWER CITY Phase 1',
              style: TextStyle(
                fontSize: 28.0,
                // fontWeight: FontWeight.bold,
                color: Colors.purple.shade900,
                // letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 30.0),

            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    // color: Colors.green,
                    height: 400,
                    'web/projectLaunch.png', // Ensure correct path to your PNG image
                  ),
                ),
                Expanded(
                  // flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 26.0),
                    // height: 00,
                    // width: 100,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // padding: EdgeInsets.symmetric(
                          //     vertical: 20, horizontal: 10),
                          decoration: boxDecoration(),

                          height: 70,
                          child: listTile(Icons.flight, 'Devanahalli',
                              '20 Mins. from Kempagowda International Airport '),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 70,
                            decoration: boxDecoration(),
                            child: listTile(
                                Icons.architecture_sharp, '10 Acres', 'Area')),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(
                          //     vertical: 20, horizontal: 10),
                          decoration: boxDecoration(),

                          height: 70,
                          child: listTile(Icons.check_circle_outline_sharp,
                              'BIAAPA Approved', 'A Khaata'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(
                          //     vertical: 20, horizontal: 10),
                          decoration: boxDecoration(),

                          height: 70,
                          child: listTile(
                              Icons.currency_rupee, '2,500 per Sq.ft.', 'Cost'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // // Divider(
            //   thickness: 2,
            //   color: Colors.green[900],
            //   indent: 350,
            //   endIndent: 350,
            // ),

            const SizedBox(
              height: 120.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'Available Configurations',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'Note: All Installments are Quarterly',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                pricingTableColumn(
                    'Type',
                    'Plot Size',
                    'Booking Amount',
                    'Installments 1 to 6',
                    'Installments 7 to 9',
                    'Installments 10 to 14',
                    'Total'),
                const SizedBox(
                  width: 10,
                ),
                pricingTableColumn('Basic', '30 x 40 sq.ft.', '₹ 4,50,000',
                    '₹ 1,50,000', '₹ 2,00,000', '₹ 2,10,000', '₹ 30 Lacs'),
                const SizedBox(
                  width: 10,
                ),
                pricingTableColumn('Standard', '30 x 50 sq.ft.', '₹ 4,50,000',
                    '₹ 1,87,500', '₹ 2,50,000', '₹ 2,85,000', '₹ 37.50 Lacs'),
                const SizedBox(
                  width: 10,
                ),
                pricingTableColumn('Premium', '40 x 60 sq.ft.', '₹ 6,00,000',
                    '₹ 3,00,000', '₹ 4,00,000', '₹ 4,80,000', '₹ 60 Lacs'),
              ],
            ),

            const SizedBox(
              height: 120.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'Location Highlights',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            sizedBoxHeight30,
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: 400,
                      color: Colors.blueGrey.shade100,
                      padding: const EdgeInsets.only(left: 150),
                      child: Row(
                        children: [
                          imageWithBorder('web/plane.jpg'),
                          highlightsDescription(
                              'KEMPEGOWDA INTERNATIONAL AIRPORT',
                              '20 Mins. to World class International Airport',
                              '-- Devanahalli'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: 400,
                      color: Colors.cyan.shade100,
                      padding: const EdgeInsets.only(right: 150),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          highlightsDescription(
                              'NAMMA METRO ',
                              'BMRCL plans, Namma Metro expansion to Devanahalli,covering approximately 15KM in north Bengaluru.',
                              '-- The Hindu'),
                          const SizedBox(
                            width: 50,
                          ),
                          imageWithBorder('web/metro.png'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      color: Colors.orange.shade100,
                      height: 400,
                      padding: const EdgeInsets.only(left: 150),
                      child: Row(
                        children: [
                          imageWithBorder('web/cauvery.jpg'),
                          highlightsDescription(
                              'CAUVERY WATER',
                              'BWSSB plans to expand Cauvery water  to Devanahalli, under Stage VI',
                              '-- Deccan Herald'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      color: Colors.lime.shade100,
                      height: 400,
                      padding: const EdgeInsets.only(right: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          highlightsDescription(
                              'SCHOOLS & COLLEGES',
                              'AKASH International, STONEHILL International, OXFORD English School, Cambridge Institute of Tech., Sir MVIT, NMIT  ',
                              '-- and many more'),
                          const SizedBox(
                            width: 50,
                          ),
                          imageWithBorder('web/school.png'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      color: Colors.green.shade100,
                      height: 400,
                      padding: const EdgeInsets.only(left: 150),
                      child: Row(
                        children: [
                          imageWithBorder('web/hospital.png'),
                          highlightsDescription(
                              'HOSPITALS & HEALTH CARE',
                              'Akash Hospital,Manipal Hospital, Leena Multispeciality Hospital ',
                              '-- and many more'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: 400,
                      color: Colors.deepOrange.shade100,
                      padding: const EdgeInsets.only(right: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          highlightsDescription(
                              'BUSINESS TECH PARKS',
                              'Devanahalli Business Park, Foxconn (iPhone)',
                              '-- and many more to come'),
                          const SizedBox(
                            width: 50,
                          ),
                          imageWithBorder('web/businessparks.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 120.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              child: const Text(
                'PREMIUM AMENITIES',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 10.0,
              child: Container(
                color: Colors.red.shade50,
                height: 600,
                width: 1100,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.archway,
                            title: 'Grand Entrance Arch'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.industry,
                            title: 'Sewage Treatment Plant'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.bolt,
                            title: 'Underground Electric Cables'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.cloudRain,
                            title: 'Rain Water Harvesting'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.lightbulb,
                            title: 'LED Street Lights'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.road,
                            title: 'Asphalted Roads'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.child,
                            title: 'Kid\'s Play Area'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.personWalking,
                            title: 'Pedestrian Pathway'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.personSwimming,
                            title: 'Swimming Pool'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.dumbbell, title: 'Gym'),
                        AmenitiesWidget(
                            icon: Icons.plumbing,
                            title: 'Underground Drainage'),
                        AmenitiesWidget(
                            icon: FontAwesomeIcons.tint,
                            title: 'Central water Tank Supply'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 60.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'GALLERY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Divider(
            //   // height: 6,
            //   thickness: 2,
            //   color: Colors.green[900],
            //   indent: 100,
            //   endIndent: 100,
            // ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  // const ResponsiveImageWithDescription(0),
                  // sizedBoxHeight30,
                  const ResponsiveImageWithDescription(1),
                  sizedBoxHeight30,
                  const ResponsiveImageWithDescription(2),
                  sizedBoxHeight30,
                  const ResponsiveImageWithDescription(3),
                  sizedBoxHeight30,
                  // const ResponsiveImageWithDescription(4),
                  // sizedBoxHeight30,
                  const ResponsiveImageWithDescription(5),
                  sizedBoxHeight30,
                  const ResponsiveImageWithDescription(6),
                  sizedBoxHeight30,
                  const ResponsiveImageWithDescription(7),
                  sizedBoxHeight30,
                  const ResponsiveImageWithDescription(8),
                  sizedBoxHeight30,
                  // const ResponsiveImageWithDescription(9),
                  // sizedBoxHeight30,
                ],
              ),
            ),

            const SizedBox(
              height: 60,
            ),
            Container(
              // margin: EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'Why GruhaKalpa ?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'You are our Priority, We ensure ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              height: 200,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AmenitiesWidget(
                      icon: FontAwesomeIcons.lock,
                      title: 'Safe Money Transaction'),
                  AmenitiesWidget(
                      icon: FontAwesomeIcons.dove, title: 'Peace of Mind'),
                  AmenitiesWidget(
                      icon: FontAwesomeIcons.magnifyingGlass,
                      title: 'Transparent services'),
                  AmenitiesWidget(
                      icon: FontAwesomeIcons.zero, title: 'Zero  Commission'),
                  AmenitiesWidget(
                      icon: FontAwesomeIcons.handshake, title: 'Trust')
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                // color: Colors.red[200],
                height: 250,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //  height: 220,
                      //width: double.infinity,
                      //  color: Colors.amber[600],
                      padding: const EdgeInsets.all(14.0),
                      child: controller.address(),
                    ),

                    verticalDivider,
                    Expanded(
                      child: Container(
                        //  height: 220,
                        // width: double.infinity,
                        padding: const EdgeInsets.all(14.0),
                        child: controller.quickLinks(),
                      ),
                    ),
                    verticalDivider,
                    Expanded(
                      child: Container(
                        // color: Colors.red[200],
                        //  height: 220,
                        //width: double.infinity,
                        padding: const EdgeInsets.all(14.0),
                        child: controller.socialMediaLinks(),
                      ),
                    ),
                    verticalDivider,
                    Expanded(
                      child: Container(
                        //  height: 220,
                        // width: double.infinity,
                        padding: const EdgeInsets.all(14.0),
                        child: controller.contactDetails(),
                      ),
                    ),
                    //  controller.address(),
                    //  controller.socialMediaLinks(),
                    // Expanded(
                    //   child: controller.contactDetails(),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   child: Icon(Icons.keyboard_double_arrow_up_sharp),
      // ),
    );
  }

  SizedBox pricingTableColumn(
    feature1,
    feature2,
    feature3,
    feature4,
    feature5,
    feature6,
    feature7,
  ) {
    return SizedBox(
      // color: Colors.amber,
      height: 480,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          pricingContainer(feature1, 1),
          // SizedBox(height: 2),
          pricingContainer(feature2, 2),
          // SizedBox(height: 2),
          pricingContainer(feature3, 3),
          // SizedBox(height: 2),
          pricingContainer(feature4, 4),
          pricingContainer(feature5, 5),
          pricingContainer(feature6, 6),
          pricingContainer(feature7, 7),
        ],
      ),
    );
  }

  Container pricingContainer(String feature, [int? i]) {
    return Container(
      // margin: EdgeInsets.only(top: 6.0),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.orange.shade200,
        gradient: i! % 2 != 0
            ? LinearGradient(
                colors: [Colors.purple.shade300, Colors.teal.shade100])
            : null,
      ),
      child: Text(
        feature,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container highlightsDescription(
      String title1, String description, String publisher) {
    return Container(
      alignment: Alignment.topLeft,
      height: 200,
      width: 500,
      child: LocationHighlightsEntry(
          title: title1, subtitle: description, publisher: publisher),
    );
  }

  Container imageWithBorder(String image) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.orange, // Outer border color
          width: 4.0,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Change this to your desired orange shade
            width: 4.0, // Adjust border width as needed
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            image,
            height: 320,
            width: 320,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  ListTile listTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40.0,
        color: Colors.black87,
      ),
      subtitle: Text(subtitle),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          // letterSpacing: 1.0,
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
          Colors.lightBlue.withOpacity(0.8),
          Colors.purple.shade200.withOpacity(0.8),
        ], // Gradient colors
      ),
    );
  }
}

buildActivitiesColumn(String description, String emoji) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          // '🧘',
          emoji,
          style: const TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      sizedBoxHeight10,
      Text(
        ' $description',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
