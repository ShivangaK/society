import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:society/constants.dart';
import 'package:intl/intl.dart';
import 'package:society/validators.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {
  PaymentDetailsView({Key? key}) : super(key: key);

  // final PaymentDetailsController pdController =
  //     Get.put(PaymentDetailsController());
  // Define options for the status dropdown
  final List<String> statusOptions = [
    // 'Pending',
    'Confirmed',
    // 'Not Received',
  ];

  final List<String> transactionTypeOptions = ['Credit', 'Debit'];

  final List<String> bankOptions = ['APEX', 'HDFC'];

  final List<String> paymenttypeOptions = [
    'Site Booking',
    // 'Installment',
    // 'Penalty',
    'Membership Fee',
    'Fixed Deposit',
    'Recurring Deposit'
  ];

  final List<String> paymentModeOptions = [
    'CASH',
    'Net Banking',
    'UPI',
    'Phone Pay',
    'Google Pay',
    'DD',
    'Cheque',
  ];

  final List<Map<String, dynamic>> projectOptions = [
    {'value': 1, 'label': 'Powercity'},
    // {'value': 2, 'label': 'Nandi Hills'}
    {'value': 3, 'label': 'NA'}
  ];

  @override
  final PaymentDetailsController controller =
      Get.put(PaymentDetailsController());

  // final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // print(
    //     'AMOUNT on load: ${controller.singleReceipt.value.aMOUNT.toString()}');
    return Scaffold(
      appBar: mobileAppBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Obx(() {
            return FormBuilder(
              key: controller.formKey_payment,
              child: SizedBox(
                height: Get.height * 0.95,
                child: Column(
                  children: [
                    const Hero(
                      tag: "tag",
                      child: Text(
                        "Update Payment Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() {
                                      return FormBuilderTextField(
                                        // validator: controller
                                        //             .TransactionIDController.text.
                                        //         .
                                        //     ? numberValidator()
                                        //     : null,
                                        controller:
                                            controller.TransactionIDController,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'TRANSACTIONID',
                                        onChanged: (value) {
                                          print('Inside Transaction ID');

                                          if (value != null &&
                                              value.isNotEmpty &&
                                              int.tryParse(value)! > 0) {
                                            controller.isTransactionId.value =
                                                true;
                                          } else {
                                            controller.isTransactionId.value =
                                                false;
                                          }
                                        },
                                        // readOnly: true,
                                        // initialValue: "1",
                                        decoration: InputDecoration(
                                            helperText:
                                                "Enter Transaction ID to be Edited",
                                            // border: OutlineInputBorder(),
                                            labelText: 'Transaction Id',
                                            suffixIcon:
                                                controller.isTransactionId.value
                                                    ? IconButton(
                                                        onPressed: () async {
                                                          print(
                                                              'Inside Transaction ID Edit');

                                                          // print(controller
                                                          //     .TransactionIDController
                                                          //     .text);
                                                          await controller
                                                              .fetchTransactionDetails(
                                                                  controller
                                                                      .MEMBERSHIPIDController
                                                                      .text,
                                                                  controller
                                                                      .TransactionIDController
                                                                      .text);

                                                          // await controller
                                                          //     .fetchMemberName_PhoneNo(
                                                          //         controller
                                                          //             .MEMBERSHIPIDController
                                                          //             .text);
                                                        },
                                                        icon: const Icon(
                                                            Icons.search),
                                                      )
                                                    : null),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    FormBuilderTextField(
                                      // key: UniqueKey(),
                                      // initialValue: controller
                                      //     .singleReceipt.value.mEMBERSHIPID
                                      //     .toString(),
                                      onChanged: (value) {
                                        controller.memberName.value = '';
                                        controller.memberPhone.value = '';
                                        controller.isDbConnected.value = true;
                                      },
                                      controller:
                                          controller.MEMBERSHIPIDController,
                                      // onSubmitted: (value) => int.parse(value.toString()),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      name: 'MEMBERSHIPID',
                                      decoration: InputDecoration(
                                        hintText:
                                            "Enter Membership ID and Click on Search..",
                                        hintStyle:
                                            const TextStyle(fontSize: 12.0),
                                        helperText: controller
                                                .isDbConnected.value
                                            ? '${controller.memberName.value} ${controller.memberPhone.value}'
                                            : "Connection Error, Pls Try again",
                                        helperStyle: controller
                                                    .isDbConnected.value ==
                                                false
                                            ? const TextStyle(color: Colors.red)
                                            : null,
                                        labelText: 'Membership ID',
                                        suffixIcon: controller
                                                .isMemberNameLoading.value
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(Colors.blue),
                                                strokeWidth: 2.0,
                                                backgroundColor:
                                                    Colors.grey[200],
                                              )
                                            : IconButton(
                                                onPressed: () async {
                                                  //print('Inside Membership ID');
                                                  if (controller
                                                      .MEMBERSHIPIDController
                                                      .text
                                                      .isNotEmpty) {
                                                    await controller
                                                        .fetchMemberName_PhoneNo(
                                                            controller
                                                                .MEMBERSHIPIDController
                                                                .text);
                                                  } else {
                                                    Get.snackbar(
                                                      "Alert",
                                                      "Pls. Enter Membership ID.",
                                                      backgroundColor:
                                                          Colors.amber,
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                    );
                                                  }
                                                },
                                                icon: const Icon(Icons.search),
                                              ),
                                      ),
                                      validator: numberValidator(),
                                      // FormBuilderValidators.required(),
                                    ),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        key: UniqueKey(),
                                        initialValue: controller.singleReceipt
                                            .value.tRANSACTIONTYPE,
                                        name: 'TRANSACTION_TYPE',
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: const InputDecoration(
                                            labelText: 'Transaction Type'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: transactionTypeOptions
                                            .map(
                                              (option) => DropdownMenuItem(
                                                value: option,
                                                child: Text(option),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDateTimePicker(
                                        key: UniqueKey(),
                                        initialValue: controller.singleReceipt
                                            .value.tRANSACTIONDATE,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'TRANSACTION_DATE',
                                        inputType: InputType.both,
                                        format:
                                            DateFormat('dd-MM-yyyy HH:mm:ss'),
                                        valueTransformer: (value) =>
                                            value!.toIso8601String(),
                                        decoration: const InputDecoration(
                                          labelText:
                                              'Transaction Date and Time',
                                          suffixIcon: Icon(
                                              Icons.calendar_month_rounded),
                                        ),
                                        validator:
                                            FormBuilderValidators.required(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    // GetBuilder<PaymentDetailsController>(
                                    //     builder: (controllerpd) {
                                    //   return
                                    Obx(() {
                                      return FormBuilderTextField(
                                        // key: UniqueKey(),
                                        // initialValue: controller
                                        //         .singleReceipt.value.aMOUNT
                                        //         ?.toString() ??
                                        //     '',
                                        onChanged: (value) {
                                          controller.updateAmount(value!);
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'AMOUNT',
                                        decoration: InputDecoration(
                                          labelText: 'Amount',
                                          helperText:
                                              controller.getHelperText(),
                                          helperStyle: const TextStyle(
                                              color: Colors.red),
                                        ),
                                        validator: numberValidator(),
                                      );
                                    }),
                                    // ;
                                    // }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderTextField(
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.fROMACCOUNT,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'FROM_ACCOUNT',
                                        decoration: const InputDecoration(
                                          labelText: 'From Account',
                                        ),
                                        validator:
                                            FormBuilderValidators.required(),
                                        // maxLines: 3,
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        // onSaved: controller.singleReceipt.value = null,
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.tOACCOUNT,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'TO_ACCOUNT',
                                        decoration: const InputDecoration(
                                            labelText: 'To Account'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: bankOptions
                                            .map(
                                              (option) => DropdownMenuItem(
                                                value: option,
                                                child: Text(option),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() {
                                      return FormBuilderTextField(
                                        // onChanged: (value) {
                                        //   controller.singleReceipt.update((val) {
                                        //     val?.dESCRIPTION = value;
                                        //   });
                                        // },
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.dESCRIPTION,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'DESCRIPTION',
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Description/Cheque No. and Date'),
                                        // maxLines: 3,
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.sTATUS,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'STATUS',
                                        decoration: const InputDecoration(
                                            labelText: 'Payment Status'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: statusOptions
                                            .map(
                                              (option) => DropdownMenuItem(
                                                value: option,
                                                child: Text(option),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderTextField(
                                        key: UniqueKey(),
                                        initialValue: controller.singleReceipt
                                            .value.rEFERENCENUMBER,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'REFERENCE_NUMBER',
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Transaction Ref. Number'),
                                        validator:
                                            FormBuilderValidators.required(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.pAYMENTMODE,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'PAYMENT_MODE',
                                        decoration: const InputDecoration(
                                            labelText: 'Payment Mode'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: paymentModeOptions
                                            .map(
                                              (option) => DropdownMenuItem(
                                                value: option,
                                                child: Text(option),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.pAYMENTTYPE,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'PAYMENT_TYPE',
                                        decoration: const InputDecoration(
                                            labelText: 'Payment Type'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: paymenttypeOptions
                                            .map(
                                              (option) => DropdownMenuItem(
                                                value: option,
                                                child: Text(option),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderTextField(
                                        // key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.iNSTALLMENTNO
                                            .toString(),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'INSTALLMENT_NO',
                                        decoration: const InputDecoration(
                                          labelText: 'Installment No.',
                                        ),
                                        validator: numberValidator(),
                                        // maxLines: 3,
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    Obx(() {
                                      return FormBuilderDropdown(
                                        key: UniqueKey(),
                                        initialValue: controller
                                            .singleReceipt.value.pROJECTCODE,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        name: 'PROJECT_CODE',
                                        decoration: const InputDecoration(
                                            labelText: 'Project Name'),
                                        validator:
                                            FormBuilderValidators.required(),
                                        items: projectOptions.map(
                                          (option) {
                                            return DropdownMenuItem(
                                              value: option['value'],
                                              child: Text(option['label']),
                                            );
                                          },
                                        ).toList(),
                                      );
                                    }),
                                    sizedBoxHeight30,
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.verified),
                                      onPressed: () async {
                                        if (controller
                                            .formKey_payment.currentState!
                                            .saveAndValidate()) {
                                          final formData = controller
                                              .formKey_payment
                                              .currentState!
                                              .value;

                                          Get.dialog(verifyDialog(),
                                              arguments: formData);
                                        }
                                      },
                                      label: const Text('Verify'),
                                    ),
                                    // sizedBoxHeight30,
                                    // Obx(() {
                                    //   return ElevatedButton.icon(
                                    //     icon: const Icon(Icons.clear_all),
                                    //     onPressed: () {
                                    //       controller
                                    //           .formKey_payment.currentState!
                                    //           .reset();
                                    //     },
                                    //     label: const Text('Reset'),
                                    //   );
                                    // }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  verifyDialog() {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Verify The Details'),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
              size: 24.0,
              color: Colors.red,
            ),
          ),
        ],
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      content: Container(
        width: 400,
        height: 430,
        child: SingleChildScrollView(
          child: Obx(() {
            print('Inside Verify Dialog');

            var formdata = Get.arguments;

            DateTime dateTime = DateTime.parse(formdata['TRANSACTION_DATE']);

            // Format date to 'dd-MMM-yyyy HH:mm:ss'
            final DateFormat formatter = DateFormat('dd-MMM-yyyy HH:mm:ss');
            String formatted = formatter.format(dateTime);

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight30,
                Text(
                  'Name : ${controller.memberName.value}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
                Text(
                  'Membership ID: ${formdata['MEMBERSHIPID']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
                Text(
                  'Amount(Rs): ${formdata['AMOUNT']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(controller.getHelperText()),
                sizedBoxHeight30,
                Text(
                  'Txn. Date: $formatted',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
                Text(
                  'Txn. Ref.: ${formdata['REFERENCE_NUMBER']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
                Text(
                  'Payment Mode: ${formdata['PAYMENT_MODE']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
                Text(
                  'Payment For: ${formdata['PAYMENT_TYPE']}',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                sizedBoxHeight30,
              ],
            );
          }),
        ),
      ),
      actions: [
        Obx(
          () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                // minimumSize: Size.fromHeight(72),
                // textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                print(controller.TransactionIDController.text);
                // if (controller.formKey_payment.currentState!
                //         .fields['TRANSACTIONID']!.value ==
                //     null)

                // if(formdata['TRANSACTIONID'])                    {
                //
                if (controller.TransactionIDController.text == '0') {
                  print('Inside Save to API');

                  controller.isLoadingforButton.value = true;
                  await controller.sendToAPIForSave(
                      controller.formKey_payment.currentState!.value,
                      controller.memberName.value,
                      controller.memberPhone.value);

                  // scontroller.resetForm();
                } else {
                  controller.isLoadingforButton.value = true;
                  // print(controller.formKey_payment.currentState!
                  //     .fields['TRANSACTIONID']!.value);
                  // print(controller.TransactionIDController.text);
                  print('Inside Edit to API dialog');
                  await controller.sendEditedToAPIForSave(
                      controller.formKey_payment.currentState!.value,
                      controller.memberName.value,
                      controller.memberPhone.value);

                  // await controller.memberDetailsEdit(mergedDetails);
                }
              },
              child: controller.isLoadingforButton.value
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                            strokeWidth: 3,
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text('Saving Data')
                      ],
                    )
                  : controller.isDataSaved.value
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle),
                            SizedBox(
                              width: 14,
                            ),
                            Text('Data Saved')
                          ],
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.save_rounded),
                            SizedBox(
                              width: 14,
                            ),
                            Text('Save')
                          ],
                        ),
            );
          },
        ),
      ],
    );
  }

  Widget buildButton() => OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          side: const BorderSide(
            width: 2,
            color: Colors.indigo,
          ),
        ),
        onPressed: () {},
        child: const Text(
          'SUBMIT',
          style: TextStyle(
            fontSize: 24,
            color: Colors.indigo,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget buildSmallButton(bool isdone) {
    final color = isdone ? Colors.green : Colors.indigo;

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isdone
            ? const Icon(
                Icons.done,
                size: 52,
                color: Colors.white,
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
