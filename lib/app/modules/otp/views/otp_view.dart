import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/custom_widgets/otp_timer.dart';
import 'package:society/validators.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  // const OtpView({Key? key}) : super(key: key);
  final OtpController otpController = Get.put(OtpController());
  static final mobileNumberController = TextEditingController();

  OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // actions: [
      //   // Row(
      //   //   mainAxisAlignment: MainAxisAlignment.end,
      //   //   children: [
      //   IconButton(
      //     icon: Icon(Icons.close),
      //     onPressed: () {
      //       // Navigator.of(context).pop();
      //       Get.back(); // Close the dialog
      //     },
      //   ),
      //   //   ],
      //   // ),
      // ],
      // actionsAlignment: MainAxisAlignment.end,

      // actionsPadding: EdgeInsets.only(right: 8.0, top: 8.0),
      contentPadding: EdgeInsets.zero,
      scrollable: true,
      // icon: Icon(Icons.shield),
      title: const Text(
        " OTP Verification",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 18.0),
      content: Padding(
        padding: Get.width < 500
            ? const EdgeInsets.all(06.0)
            : const EdgeInsets.all(16.0),
        child: GetBuilder<OtpController>(builder: (otpController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: Get.width < 500 ? Get.width : Get.width / 3.5,
                      child: Obx(
                        () => TextFormField(
                          maxLength: 10,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: mobileNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  size: 20,
                                ),
                                onPressed: () {
                                  mobileNumberController.clear();
                                },
                              ),
                              prefixIcon: Image.asset(
                                "web/flag.png",
                                height:
                                    60, // Set height as per your requirement
                                // width: 24,
                              ),
                              // sizedBoxHeight10,

                              // Adjust to fit icon size

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              labelText: 'Mobile Number',
                              errorText: otpController
                                          .phoneNumberMismatch.value ==
                                      true
                                  ? 'Pls check your registered Mobile Number '
                                  : null,
                              hintText: 'Enter registered Number ',
                              helperText:
                                  'OTP will be sent to Whatsapp Number'),
                          validator: validatePhoneNumber,
                          onChanged: (value) {
                            if (value.length == 10) {
                              // print(value);
                              // if (value == '8792417622') {
                              if (receiptsLogin.contains(value)) {
                                // print('Deepika Login');
                                otpController.phoneNumberFound.value = true;
                                otpController.phoneNumberMismatch.value = false;
                                return;
                              }
                              otpController.checkMobileNumber(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Obx(
                () => Visibility(
                  visible: !controller.resendEnabled.value &&
                      !controller.getOTPClicked.value,
                  child: Visibility(
                    visible: controller.phoneNumberFound.value,
                    child: ElevatedButton(
                      onPressed: () {
                        controller
                            .startTimer(); // Start timer when "Get OTP" button is clicked
                        controller.getOTPClicked.value =
                            true; // Set flag indicating "Get OTP" button is clicked
                        controller.getOTPfromAPI(mobileNumberController.text);
                        Get.snackbar(
                            'OTP Sent to Whatsapp ', 'Please wait for OTP',
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: const Text('Click for OTP'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Visibility(
                  visible: controller.phoneNumberFound.value,
                  child: OTPTextField(
                    length: 6,
                    width: Get.width < 500 ? Get.width * 0.9 : Get.width * 0.5,
                    fieldWidth: Get.width < 500 ? 20 : 30,
                    style: const TextStyle(fontSize: 16),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onChanged: (enteredOTP) {
                      // print(enteredOTP);
                      if (enteredOTP.length == 6) {
                        otpController.verifyOTP(enteredOTP);
                      }
                    },
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     otpController
              //         .startTimer(); // Start timer when "Get OTP" button is clicked
              //     Get.snackbar('OTP Sent', 'Please wait for OTP',
              //         snackPosition: SnackPosition.BOTTOM);
              //   },
              //   child: Text('Get OTP'),
              // ),
              const SizedBox(height: 20),
              Obx(
                () => Visibility(
                  visible: controller.resendEnabled.value,
                  child: ElevatedButton(
                    onPressed: () {
                      controller
                          .resendOTP(); // Resend OTP when "Resend OTP" button is clicked
                      Get.snackbar('OTP Resent', 'New OTP has been sent',
                          snackPosition: SnackPosition.BOTTOM);
                      controller.getOTPfromAPI(mobileNumberController.text);
                    },
                    child: const Text('Resend OTP'),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     otpController.resetTimer();
              //     // Resend OTP logic can be implemented here
              //     Get.snackbar('OTP Resent', 'New OTP has been sent',
              //         snackPosition: SnackPosition.BOTTOM);
              //   },
              //   child: Obx(() =>
              //       Text('Resend OTP (${controller.timerSeconds.value})')),
              // ),
              const SizedBox(height: 10),
              Obx(() => Visibility(
                    visible: controller.timerRunning.value &&
                        !controller.resendEnabled.value,
                    child:
                        OtpTimer(timerSeconds: controller.timerSeconds.value),
                  )),
              // Obx(() => Visibility(
              //       visible: controller.timerRunning.value,
              //       child:
              //           OtpTimer(timerSeconds: controller.timerSeconds.value),
              //     )),
            ],
          );
        }),
      ),
    );
  }
}
