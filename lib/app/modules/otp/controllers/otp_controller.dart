// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:get/get.dart';
import 'package:society/app/modules/otp/providers/otp_provider.dart';
import 'package:society/app/modules/otp/views/otp_view.dart';
import 'package:society/custom_widgets/home_screen.dart';
// import 'package:society/custom_widgets/registration_screen.dart';

import '../../../../constants.dart';
import '../../home/controllers/home_controller.dart';
import '../../payment_details/views/payment_details_view.dart';

class OtpController extends GetxController {
  int _timerSeconds = 120;
  late Timer _timer;

  RxBool timerRunning = false.obs;
  RxBool resendEnabled = false.obs;
  RxBool getOTPClicked = false.obs;

  var secretKey;
  var otpFromAPI;

  RxBool phoneNumberFound = false.obs;

  RxBool phoneNumberMismatch = false.obs;

  RxInt timerSeconds = 120.obs;

  final loggedIN = 0.obs;

  final homeController = Get.find<HomeController>();

  var dbMobileNumber = ''.obs; // Making dbMobileNumber observable

  // Function to set dbMobileNumber
  void setDbMobileNumber(String mobileNumber) {
    dbMobileNumber.value = mobileNumber;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // print('Timer tick: $_timerSeconds');
      if (_timerSeconds == 0) {
        _timer.cancel();
        timerRunning.value = false;
        resendEnabled.value = true; // Enable resend after 3 minutes
      } else {
        _timerSeconds--;
        timerSeconds.value = _timerSeconds;
      }
    });
    timerRunning.value = true;
  }

  void resetTimer() {
    _timer.cancel();
    _timerSeconds = 120;
    timerSeconds.value = _timerSeconds;
    startTimer();

    update();
  }

  void stopTimer() {
    _timer.cancel();
    timerRunning.value = false;
  }

  void getOTPfromAPI(String userMobileNo) async {
    await OtpProvider().getOTP(userMobileNo);
  }

  void verifyOTP(String enteredOTP) async {
    // Implement your OTP verification logic here

    // print(otpFromAPI);
    await OtpProvider().postOTP();

    if (enteredOTP == otpFromAPI) {
      Get.snackbar('Success', 'OTP Verified Successfully',
          snackPosition: SnackPosition.BOTTOM);

      stopTimer(); // Stop timer when OTP is verified
      timerSeconds.value = 0; // Clear timer value after OTP is verified
      loggedIN.value = 1;
      // Get.to(() => const RegistrationScreen());

      // print('Raghu ${OtpView().mobileNumberController.text}');

      if (receiptsLogin.contains(OtpView.mobileNumberController.text)) {
        Get.off(() => PaymentDetailsView());
        // return;
      } else {
        Get.off(() => HomeScreen());
      }

      // Get.delete<OtpController>();
    } else {
      Get.snackbar('Error', 'Invalid OTP', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resendOTP() {
    _timer.cancel();
    _timerSeconds = 120;
    timerSeconds.value = _timerSeconds;
    startTimer(); // Restart timer when OTP is resent
    resendEnabled.value = false; // Disable resend
  }

  void checkMobileNumber(phoneNo) async {
    var no = int.parse(phoneNo);

    await homeController.fetchMemberDetails(no);

    // print('  DB ${dbMobileNumber.value}  ');
    // print('no $no');

    // print(phoneNo.runtimeType);
    // print(dbMobileNumber.value);

    if (phoneNo == dbMobileNumber.value) {
      // print('Phone Number is Found');
      phoneNumberFound.value = true;
      phoneNumberMismatch.value = false;
    } else {
      phoneNumberMismatch.value = true;
      phoneNumberFound.value = false;
      // print('Phone Number is not Found');
    }
  }

  // void increment() => count.value++;
}
