import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/custom_widgets/bottom_sheet.dart';
import 'package:society/custom_widgets/gallery.dart';

import 'package:society/custom_widgets/price_comparison_table.dart';
import 'package:society/custom_widgets/project_launch.dart';

import '../app/modules/home/controllers/home_controller.dart';

class MobileScaffold extends GetView<HomeController> {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mobileAppBar,
        bottomNavigationBar: bottomNavigationBar,
        // drawer: mobileDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: CarouselSlider.builder(
                      itemCount: controller.urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = controller.urlImages[index];
                        return controller.buildImage(urlImage, index);
                      },
                      options: controller.carouselOptions,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: Colors.green[900],
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const NewProjectLaunch(),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Available Configurations',
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
                indent: 100,
                endIndent: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                alignment: Alignment.topLeft,
                child: const Text(
                  'Note: All Installments are Quarterly',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const PriceComparisonTable(),
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
              Divider(
                // height: 6,
                thickness: 2,
                color: Colors.green[900],
                indent: 100,
                endIndent: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ResponsiveImageWithDescription(0),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(1),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(2),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(3),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(4),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(5),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(6),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(7),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(8),
                    sizedBoxHeight30,
                    const ResponsiveImageWithDescription(9),
                    sizedBoxHeight30,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildActivitiesColumn('Safe Money Transaction', ' 🛡️ '),
                    const SizedBox(
                      width: 20.0,
                    ),
                    buildActivitiesColumn('Peace of Mind', '🧘'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildActivitiesColumn('Transparent services', '🔍'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    buildActivitiesColumn('Zero  Commission', '🚫'),
                  ],
                ),
              ),
              buildActivitiesColumn('Trust', ' 🤝 '),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ColoredBox(
                  color: Colors.greenAccent.shade100,
                  child: const ContactsBottomSheet(
                    flag: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
