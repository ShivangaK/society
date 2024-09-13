import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society/app/modules/home/controllers/home_controller.dart';
import 'package:society/app/modules/home/views/aboutus_view.dart';
import 'package:society/app/modules/home/views/contact_us_view.dart';
import 'package:society/app/modules/home/views/home_view.dart';
import 'package:society/app/modules/home/views/pricing_view.dart';
import 'package:society/app/modules/home/views/privacy_policy_view.dart';
import 'package:society/app/modules/home/views/team_directors_view.dart';
import 'package:society/app/modules/home/views/terms_conditions_view.dart';
import 'package:society/app/modules/otp/controllers/otp_controller.dart';
import 'package:society/app/modules/otp/views/otp_view.dart';
import 'package:society/app/modules/payment_details/views/payment_details_view.dart';
import 'package:society/color_constants.dart';
import 'package:society/custom_widgets/home_screen.dart';
// import 'package:society/custom_widgets/registration_screen.dart';

import 'package:society/text_constants.dart';

// import 'app/modules/otp/views/otp_view.dart';

import 'package:text_3d/text_3d.dart';

import 'custom_widgets/bottom_sheet.dart';

var myDefaultBackgroundColor = Colors.grey[100];

var _verticaldivider = const VerticalDivider(
  indent: 10.0,
  endIndent: 10.0,
  color: Colors.black,
  thickness: 1, //thickness of divier line
);
// '8951815109'
var receiptsLogin = [
  '8792417622',
  '9663684195',
];
// var apiBaseUrl = 'https://69.172.233.38:5050/';

// var apiBaseUrl = 'https://91.108.105.31:5000/';

var apiBaseUrl = 'https://saangathya.in/';

// var apiBaseUrl = 'https://91.108.105.31/';

var verticaldivider1 = const VerticalDivider(
  indent: 10.0,
  endIndent: 10.0,
  color: Colors.black,
  thickness: 1, //thickness of divier line
);

var myAppBar = AppBar(
  toolbarHeight: Get.height * 0.18,
  elevation: 10.0,
  backgroundColor: Colors.grey[900],
  title: FittedBox(
    child: Text(
      companyTitle2,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        //fontSize: 20.0,
        letterSpacing: 2.0,
      ),
    ),
  ),
  centerTitle: true,
);

var myAppBar3 = AppBar(
  // toolbarHeight: 120,
  flexibleSpace: AspectRatio(
    aspectRatio: 1,
    child: FittedBox(
      child: Text(companyTitle2),
    ),
  ),
);

var myAppBarDesktop = PreferredSize(
  preferredSize: Size(Get.width, Get.height / 4.5),
  // const Size.fromHeight(150),
  child: Column(
    children: [
      //Logo, Title and Button Bar
      Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1200),
                child: Image.asset(
                  // 'web/gruhaslogo.png',
                  'web/Gk_lo.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: transparent,
                child: FadeInDown(
                  duration: const Duration(milliseconds: 1600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   'images/societylogopng.png',
                      //   fit: BoxFit.contain,
                      // ),
                      FittedBox(
                        child: Text(
                          kannadaTitle,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          kannadaSubTitle,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: black,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          englishTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: black,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          englishSubTitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: black,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FadeInRight(
                duration: const Duration(milliseconds: 1800),
                child: Container(
                  //  alignment: Alignment.bottomCenter,
                  // height: 140,
                  color: transparent,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    overflowDirection: VerticalDirection.down,
                    //  overflowButtonSpacing: 10.0,
                    // buttonHeight: 20,
                    children: [
                      // Tooltip(
                      //   message: 'Click to Download',
                      //   verticalOffset: 5,
                      //   child: TextButton.icon(
                      //     // onPressed: () => Get.to(() => MemberForm()),
                      //     onPressed: null,
                      //     // () =>
                      //     //     Get.to(() => const RegistrationScreen()),
                      //     icon: Icon(
                      //       Icons.download_sharp,
                      //       color: black,
                      //     ),
                      //     label: Text(
                      //       'Employee Login',
                      //       style: TextStyle(
                      //         color: black,
                      //         letterSpacing: 1.0,
                      //         // fontWeight: FontWeight.bold,
                      //         fontSize: 16.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //sizedBoxHeight15,,
                      TextButton.icon(
                        // onPressed: () => Get.to(() => WhatsAppMessageButton()),
                        // onPressed: () => Get.to(() => OtpView()),
                        onPressed: () {
                          Get.dialog(OtpView());
                        },
                        icon: const Icon(
                          Icons.login_sharp,
                          // size: 20,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Employee Login ',
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // MenuBar
      FadeInDown(
        delay: const Duration(seconds: 1),
        // duration: Duration(milliseconds: 1400),
        child: Container(
          color: Colors.redAccent,
          height: 40,
          child: FlipInX(
            delay: const Duration(seconds: 2),
            duration: const Duration(milliseconds: 1800),
            child: Row(
              // buttonPadding: EdgeInsets.all(8.0),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => Get.toNamed('/home'),
                  icon: Icon(
                    Icons.home,
                    color: black,

                    // size: 20,
                  ),
                  label: Text(
                    home,
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,

                // TextButton.icon(
                //   onPressed: () => Get.to(() => PaymentDetailsView()),
                //   icon: Icon(
                //     Icons.currency_rupee,
                //     color: black,

                //     // size: 20,
                //   ),
                //   label: Text(
                //     "Payment Details",
                //     style: TextStyle(
                //       color: black,
                //       letterSpacing: 1.0,
                //     ),
                //   ),
                // ),

                // _verticaldivider,
                TextButton.icon(
                  onPressed: () => Get.to(() => const AboutusView()),
                  icon: Icon(
                    Icons.groups_3_rounded,
                    color: black,
                  ),
                  label: Text(
                    aboutUs,
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,
                TextButton.icon(
                  onPressed: () => Get.to(() => const TeamDirectorsView()),
                  icon: Icon(
                    Icons.group,
                    color: black,
                  ),
                  label: Text(
                    boardOfDirectors,
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,
                TextButton.icon(
                  onPressed: () => Get.to(() => const PricingView()),
                  icon: Icon(
                    const IconData(0xf04e1, fontFamily: 'MaterialIcons'),
                    color: black,
                    size: 16.0,
                  ),
                  label: Text(
                    // 'Ongoing Project',
                    'Pricing',
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,

                TextButton.icon(
                  onPressed: () => Get.to(() => const ContactUsView()),
                  icon: Icon(
                    Icons.contact_phone_rounded,
                    color: black,
                  ),
                  label: Text(
                    contactUs,
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,
                TextButton.icon(
                  onPressed: () => Get.to(() => const PrivacyPolicyView()),
                  icon: Icon(
                    Icons.pages_outlined,
                    color: black,
                  ),
                  label: Text(
                    // societyByLaw,
                    'Privacy Policy',
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                _verticaldivider,
                TextButton.icon(
                  onPressed: () => Get.to(() => const TermsConditionsView()),
                  icon: Icon(
                    Icons.list_alt,
                    color: black,
                  ),
                  label: Text(
                    // 'Member Login',
                    'Terms & Conditions',
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                // _verticaldivider,
                // TextButton.icon(
                //   onPressed: () => Get.to(() => const CancelRefundPolicyView()),
                //   icon: Icon(
                //     Icons.free_cancellation_rounded,
                //     color: black,
                //   ),
                //   label: Text(
                //     // 'Member Login',
                //     'Cancellation/Refund Policy',
                //     style: TextStyle(
                //       color: black,
                //       letterSpacing: 1.0,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);

var x = Row(
  children: [
    // Expanded(
    //   // flex: 2,
    //   child: Ink.image(
    //     image: const AssetImage('images/societyLogo.jpeg'),
    //     fit: BoxFit.contain,
    //     // height: 200,
    //   ),
    // ),
    Expanded(
      flex: 10,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 2.0),
        color: Colors.transparent,
        child: Column(
          children: [
            FittedBox(
              child: Text(
                kannadaTitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                kannadaSubTitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                englishTitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                englishSubTitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            sizedBoxHeight10,
            Expanded(
              child: Container(
                color: Colors.yellow[800],
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  // buttonPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  // buttonHeight: 10.0,
                  children: [
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.home,
                        color: black,
                      ),
                      label: Text(
                        home,
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.groups_3_rounded,
                        color: black,
                      ),
                      label: Text(
                        aboutUs,
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.folder,
                        color: black,
                      ),
                      label: Text(
                        'Ongoing Project',
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.done_rounded,
                        color: black,
                      ),
                      label: Text(
                        'Completed Projects',
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.contact_phone_rounded,
                        color: black,
                      ),
                      label: Text(
                        contactUs,
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.pages_outlined,
                        color: black,
                      ),
                      label: Text(
                        societyByLaw,
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.login_rounded,
                        color: black,
                      ),
                      label: Text(
                        'Member Login',
                        style: TextStyle(
                          color: black,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.topCenter,
        height: 140,
        // color: Colors.amber,
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          overflowDirection: VerticalDirection.down,
          //  overflowButtonSpacing: 10.0,
          //  buttonHeight: 20,
          children: [
            Tooltip(
              message: 'Click to Download',
              verticalOffset: 5,
              child: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.download_sharp,
                  color: black,
                ),
                label: Text(
                  'Membership Form',
                  style: TextStyle(
                    color: black,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            sizedBoxHeight10,
            TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.location_on_sharp,
                // size: 20,
                color: Colors.red,
              ),
              label: Text(
                'Find us on Google Maps ',
                style: TextStyle(
                  color: black,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);

var myAppBar2 = PreferredSize(
  preferredSize: const Size.fromHeight(140),
  child: Row(
    children: [
      // Expanded(
      //   // flex: 2,
      //   child: Ink.image(
      //     image: const AssetImage('images/societyLogo.jpeg'),
      //     fit: BoxFit.contain,
      //     // height: 200,
      //   ),
      // ),
      Expanded(
        flex: 10,
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.transparent,
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  kannadaTitle,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: black,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  kannadaSubTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: black,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  englishTitle,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: black,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  englishSubTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: black,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              sizedBoxHeight10,
              Expanded(
                child: Container(
                  color: Colors.yellow[800],
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    // buttonPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    // buttonHeight: 10.0,
                    children: [
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.home,
                          color: black,
                        ),
                        label: Text(
                          home,
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.groups_3_rounded,
                          color: black,
                        ),
                        label: Text(
                          aboutUs,
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.folder,
                          color: black,
                        ),
                        label: Text(
                          'Ongoing Project',
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.done_rounded,
                          color: black,
                        ),
                        label: Text(
                          'Completed Projects',
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.contact_phone_rounded,
                          color: black,
                        ),
                        label: Text(
                          contactUs,
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.pages_outlined,
                          color: black,
                        ),
                        label: Text(
                          societyByLaw,
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.login_rounded,
                          color: black,
                        ),
                        label: Text(
                          'Member Login',
                          style: TextStyle(
                            color: black,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          alignment: Alignment.topCenter,
          height: 140,
          // color: Colors.amber,
          child: ButtonBar(
            alignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            overflowDirection: VerticalDirection.down,
            //  overflowButtonSpacing: 10.0,
            //  buttonHeight: 20,
            children: [
              Tooltip(
                message: 'Click to Download',
                verticalOffset: 5,
                child: TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.download_sharp,
                    color: black,
                  ),
                  label: Text(
                    'Membership Form',
                    style: TextStyle(
                      color: black,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              sizedBoxHeight10,
              TextButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.location_on_sharp,
                  // size: 20,
                  color: Colors.red,
                ),
                label: Text(
                  'Find us on Google Maps ',
                  style: TextStyle(
                    color: black,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

var myAppBar4 = PreferredSize(
  preferredSize: const Size.fromHeight(100),
  child: Row(
    children: [
      Expanded(
        flex: 12,
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.grey[900],
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  kannadaTitle,
                  style: TextStyle(
                    // fontSize: 18.0,
                    color: myDefaultBackgroundColor,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  kannadaSubTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: myDefaultBackgroundColor,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  englishTitle,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: myDefaultBackgroundColor,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  englishSubTitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: myDefaultBackgroundColor,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

var companyTitle =
    'The Government and Private Employees Co-operative Housing Society Ltd. ';
// (ಕರ್ನಾಟಕ ಸರ್ಕಾರದ ಸಹಕಾರ ಕಾಯ್ದೆಗೆ ಒಳಪಟ್ಟಿದೆ)
var companyTitle2 = '''ಸರ್ಕಾರಿ ಮತ್ತು ಖಾಸಗಿ ನೌಕರರ ಗೃಹ ನಿರ್ಮಾಣ ಸಹಕಾರ ಸಂಘ ನಿ.(ರಿ)

The GruhaKalpa Housing Co-operative Society Ltd. (R)
(Karnataka Government Co-Operative Societies Act)
''';

var kannadaTitle = "ದಿ ಗೃಹಕಲ್ಪ ಹೌಸಿಂಗ್ ಕೋ-ಆಪರೇಟಿವ್ ಸೊಸೈಟಿ ಲಿ.(ರಿ)";
var englishTitle = "The GruhaKalpa Housing Co-operative Society Ltd. (R)";
var kannadaSubTitle = "(ಕರ್ನಾಟಕ ಸರ್ಕಾರದ ಸಹಕಾರ ಕಾಯ್ದೆಗೆ ಒಳಪಟ್ಟಿದೆ)";
var englishSubTitle =
    "(Governed by Karnataka Government Co-operative Societies Act)";

var myDrawer = Container(
  height: Get.height / 1.3,
  margin: const EdgeInsets.only(bottom: 4),
  child: Drawer(
    backgroundColor: Colors.grey[50],
    child: Column(
      children: [
        DrawerHeader(
          child: Ink.image(
            image: const AssetImage('images/societyLogo.jpeg'),
            fit: BoxFit.contain,
            height: 200,
            child: InkWell(
              splashColor: Colors.green.withOpacity(.6),
              onTap: () {},
            ),
          ),
          // child: Image.asset(
          //   'images/societyLogo.jpeg',
          //   fit: BoxFit.contain,
          // ),
        ),
        myListTile(Icons.home, 'HOME'),
        myListTile(Icons.groups_3_rounded, 'ABOUT US'),
        myListTile(Icons.folder, 'ONGOING PROJECT'),
        myListTile(Icons.done_rounded, 'COMPLETED PROJECTS'),
        myListTile(Icons.contact_phone_rounded, 'CONTACT US'),
        myListTile(Icons.pages_outlined, 'SOCIETY BYLAW'),
        myListTile(Icons.login_rounded, 'MEMBER LOGIN'),
      ],
    ),
  ),
);

ListTile myListTile(IconData? icon, String title) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.grey[900],
    ),
    title: Text(
      title,
      style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.grey[900],
          fontWeight: FontWeight.bold),
    ),
  );
}

var sizedBoxHeight10 = const SizedBox(
  height: 10,
);

var sizedBoxHeight30 = const SizedBox(
  height: 30,
);

var sizedBoxHeight15 = const SizedBox(
  height: 15,
);
var verticalDivider = const VerticalDivider(
  color: Colors.black,
  width: 40,
  indent: 60,
  endIndent: 60,
  thickness: 1,
);

var horizontalDivider = const Divider(
  height: 10,
  thickness: 5,
  indent: 20,
  endIndent: 20,
  color: Colors.redAccent,
);

var bottomNavigationBar = Container(
  // padding: EdgeInsets.symmetric(horizontal: 20.0),
  decoration: BoxDecoration(
    // color: Colors., // Optional for background color
    borderRadius: BorderRadius.circular(2.0),
    // shape: BoxShape.circle,
    gradient: const LinearGradient(
      // Define the gradient
      begin: Alignment.centerLeft, // Gradient starting point (adjust as needed)
      end: Alignment.centerRight, // Gradient ending point (adjust as needed)
      colors: [
        Colors.purple,
        Colors.blue,
      ], // List of colors for the gradient
    ),
    // border: Border.all(
    //   width: 1.0,
    //   color: Colors.black,
    // ),
  ),
  child: TextButton(
    onPressed: () {
      Get.bottomSheet(
        backgroundColor: Colors.white,
        const ContactsBottomSheet(
          flag: 0,
        ),
      );
    },
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, // Text color (optional)
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.call),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Book Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        )
      ],
    ),
  ),
);
var mobileAppBar = AppBar(
  elevation: 10.0,
  backgroundColor: Colors.yellow.shade500,
  shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  title: GetBuilder<HomeController>(
    builder: (controller) {
      return ThreeDText(
        text: controller.companyName.tr,
        textStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
        depth: 8,
        style: ThreeDStyle.raised,
      );
      // Text(
      //   controller.companyName.tr,
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 20.0,
      //     letterSpacing: 1.0,
      //   ),
      // );
    },
  ),
  centerTitle: true,
  actions: [
    Obx(() {
      return TextButton(
        onPressed: () {
          // print("Login Pressed");
          // if (controller.loggedIN.value == 0) {
          if (Get.put(OtpController()).loggedIN.value == 0) {
            Get.dialog(OtpView());
          } else if (Get.put(OtpController()).loggedIN.value == 1) {
            Get.put(OtpController()).loggedIN.value == 0;
            // Get.back();
            // Get.offAll(HomeView());
            Get.offAllNamed('/home');
          }

          // }

          // Get.to(() => HomeScreen());
        },
        child: Get.put(OtpController()).loggedIN.value == 0
            ? const Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              )
            : const Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
      );
    }),

    // Uncomment for Language Change
    // GetBuilder<HomeController>(
    //   builder: (controller) => TextButton(
    //     onPressed: controller.changeLanguage,
    //     child: Text(
    //       controller.language.tr,
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 12.0,
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    // ),
  ],
);

Drawer mobileDrawer(BuildContext context) {
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
    ),
    backgroundColor: Colors.black,
    // width: Get.width * 0.6,
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          // margin: EdgeInsets.all(0),

          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'web/gkmo.png'), // Replace with your logo image path
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GRUHAKALPA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                    ),
                  ),
                  Text(
                    'Housing Co-operative Society',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListTile(
          // splashColor: Colors.yellow,
          // contentPadding: EdgeInsets.symmetric(vertical: 0),
          leading: const Icon(
            Icons.info,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'About Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'Payment Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            Get.to(PaymentDetailsView());
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.contact_phone_rounded,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'Contact Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.group,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'Board of Directors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.tips_and_updates,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'New Updates',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.pages_outlined,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'Society ByLaw',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 0.4,
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
            size: 22.0,
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              //    fontFamily: 'Roboto',553189
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

openDialog() async {
  null;
  // await Get.dialog(MemberForm());
}
