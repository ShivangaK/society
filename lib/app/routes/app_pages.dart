import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/payment_details/bindings/payment_details_binding.dart';
import '../modules/payment_details/views/payment_details_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    // GetPage(
    //   name: _Paths.RECEIPTS,
    //   page: () => ReceiptsView(),
    //   binding: ReceiptsBinding(),
    // ),
  ];
}
