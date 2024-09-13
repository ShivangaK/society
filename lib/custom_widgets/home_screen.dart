import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society/app/modules/payment_details/controllers/payment_details_controller.dart';
import 'package:society/app/modules/payment_details/views/receipts_view.dart';
import 'package:society/constants.dart';

import '../app/modules/home/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // var mobilePlatform = GetPlatform.isMobile;

    var horizontalDivid = const Divider(
      height: 1,
      thickness: 1,
      indent: 20,
      endIndent: 20,
      // color: Colors.orange,
    );

    return Scaffold(
      backgroundColor: myDefaultBackgroundColor,
      appBar: mobileAppBar,
      // drawer: mobilePlatform ? mobileDrawer(context) : null,
      body: SafeArea(
          child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  final imageBytes = homeController.imageBytes.value;

                  return imageBytes == null
                      ? const SizedBox(
                          height: 250,
                          width: 250,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('web/gruhaslogo.png'),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            // padding: const EdgeInsets.symmetric(vertical: 80.0),
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
                                  color: Colors
                                      .white, // Change this to your desired orange shade
                                  width: 4.0, // Adjust border width as needed
                                ),
                              ),
                              child: ClipOval(
                                child: Image.memory(
                                  homeController.imageBytes.value!,
                                  height: 160,
                                  width: 160,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(homeController.NAMEController.text,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const Icon(Icons.note_alt),
                title: Text(homeController.MEMBERSHIPIDController.text,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
                subtitle: const Text(
                  'Membership ID',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.mobile_friendly),
                title: Text(homeController.MOBILENOController.text,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold)),
                subtitle:
                    const Text('Mobile', style: TextStyle(fontSize: 10.0)),
              ),
              sizedBoxHeight30,
              horizontalDivid,
              sizedBoxHeight30,
              const Center(
                child: SizedBox(
                  child: Text('Services (Under Development)'),
                ),
              ),
              sizedBoxHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Services(
                    icon: Icons.home,
                    title: 'Bookings',
                    type: 'B',
                  ),
                  Services(
                    icon: Icons.savings_sharp,
                    title: 'FD / RD',
                    type: 'F',
                  ),
                ],
              ),
              sizedBoxHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Services(
                    icon: Icons.receipt_long_outlined,
                    title: 'Receipts',
                    type: 'R',
                  ),
                  Services(
                    icon: Icons.badge_rounded,
                    title: 'ID Card',
                    type: 'I',
                  ),
                ],
              ),
              sizedBoxHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Services(
                    icon: Icons.card_membership_outlined,
                    title: 'Share Certificate',
                    type: 'S',
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Services extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? type;

  final PaymentDetailsController paymentDetailsController =
      Get.put(PaymentDetailsController());

  final HomeController homeController = Get.put(HomeController());

  Services({
    super.key,
    required this.icon,
    required this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(title),
      icon: Icon(icon),
      onPressed: () async {
        if (type == 'R') {
          // await PaymentDetailsController().fetchMemberPayments('232');
          await paymentDetailsController.fetchMemberPayments(
              homeController.membershipIdForEdit.toString());
          // print(homeController.membershipIdForEdit.toString());
          // PaymentDetailsController.isNavigatedFromReceiptsView = true;
          Get.to(() => ReceiptsView());
          // Get.to(() => ReceiptsView(), arguments: {"MemberId": 232});
        }
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side:
            const BorderSide(width: 0.8, color: Colors.grey), // outline border
      ),
    );
  }
}
