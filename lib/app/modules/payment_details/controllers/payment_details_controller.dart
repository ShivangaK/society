// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:society/app/modules/payment_details/providers/payment_details_provider.dart';
import 'package:society/app/modules/payment_details/receipts_model.dart';

import '../../../../custom_widgets/numtowords.dart';

class PaymentDetailsController extends GetxController {
  late final GlobalKey<FormBuilderState> formKey_payment;
  late TextEditingController MEMBERSHIPIDController;
  late TextEditingController TransactionIDController;

  final count = 0.obs;

  var memberName = ''.obs;

  var memberPhone = ''.obs;

  final amount = ''.obs;

  var isMemberNameLoading = false.obs;

  var isButtonStretched = false.obs;
  var isdone = true.obs;

  // Edit Mode decider Flag.   false: First Time Save,  True: In Edit Mode
  var isTransactionId = false.obs;

  var isDbConnected = true.obs;

  var isDataSaved = false.obs;

  var isLoadingforButton = false.obs;

  static bool isNavigatedFromReceiptsView = false;

  // List<Receipts> receiptsList = List.empty(growable: true);

  var receipts = <Receipts>[].obs;

  var singleTransaction = <Receipts>[].obs;

  Rx<Receipts> singleReceipt = Receipts().obs;

  void updateAmount(String newValue) {
    // print(newValue);
    amount.value = newValue;
    // update();
  }

  // Amount to Words
  String getHelperText() {
    // print('Inside Helper Text');
    if (amount.value.isNotEmpty) {
      try {
        int parsedAmount = int.parse(amount.value);
        return "${NumberToWords.convert(parsedAmount)} Rupees ";
      } catch (e) {
        return 'Invalid number';
      }
    }
    return '';
  }

  @override
  void onInit() {
    formKey_payment = GlobalKey<FormBuilderState>();
    MEMBERSHIPIDController = TextEditingController();
    TransactionIDController = TextEditingController(text: '0');

    super.onInit();

    // final arguments = Get.arguments as Map<String, dynamic>;
    // var memberId = arguments['MemberId'];
    print(isNavigatedFromReceiptsView);
    // if (isNavigatedFromReceiptsView) {
    //   fetchMemberPayments('1236');
    // }
  }

  @override
  void onClose() {
    MEMBERSHIPIDController.dispose();
    TransactionIDController.dispose();
    super.onClose();
    isNavigatedFromReceiptsView = false;
  }

  sendToAPIForSave(formInputParameters, memberName, memberPhone) async {
    // print("Inside Controller");

    // isDataSaved.value = false;
    var response = await PaymentDetailsProvider()
        .postFormInputsToServer(formInputParameters, memberName, memberPhone);

    formKey_payment.currentState!.fields['TRANSACTIONID']!
        .didChange(response['transactionIdX'].toString());

    // print('In Controller $response');

    if (response['status'] == 1) {
      count.value = 1;
      isDataSaved.value = true;
      isLoadingforButton.value = false;

      // formKey_payment.currentState!.patchValue({
      //   'TRANSACTIONID': 0,
      // });
    }
  }

  sendEditedToAPIForSave(formInputParameters, memberName, memberPhone) async {
    // print("Inside Controller");

    // isDataSaved.value = false;
    var response = await PaymentDetailsProvider().postEditFormInputsToServer(
        formInputParameters, memberName, memberPhone);

    print(response['message']);
    // formKey_payment.currentState!.fields['TRANSACTIONID']!
    //     .didChange(response['transactionIdX'].toString());

    print('In Controller, Edit Functionality $response');

    if (response['status'] == 1) {
      count.value = 1;
      isDataSaved.value = true;
      isLoadingforButton.value = false;
    }
  }

  void increment() => count.value++;

  fetchMemberName_PhoneNo(String memberId) async {
    isMemberNameLoading.value = true;
    memberName.value = '';

    memberPhone.value = '';
    // print('Inside fetchMemberNameNo Payment Details Controller ');

    var res =
        await PaymentDetailsProvider().fetchmemberNameandPhone(memberId, '0');

    // print(res);

    if (res == 0) {
      // DB Not Connected
      isDbConnected.value = false;
      // isMemberNameLoading.value = false;
    } else {
      isDbConnected.value = true;
      // isMemberNameLoading.value = false;

      memberName.value = res['MemberName'];
      memberPhone.value = res['MemberPhone'].toString();
    }

    isMemberNameLoading.value = false;
  }

  // Fetch all Transactions of a Member
  fetchMemberPayments(String memberId) async {
    // print('Inside fetchMemberPayments Payment Details Controller ');

    // 1 is Used to fetch Payment Details
    var res = await PaymentDetailsProvider()
        .fetchmemberNameandPhone(memberId, '1', '1');

    List<Receipts> receiptsList = Receipts().parseReceipts(res['Transactions']);

    // print(receiptsList);

    receipts.value = receiptsList;
  }

  // Fetch Single Transaction Details of a Member
  fetchTransactionDetails(String memberId, String tranid) async {
    // isMemberNameLoading.value = true;
    // print('Inside fetchTransactionDetails Payment Details Controller ');

    List<Receipts> receiptsList = List.empty();

    // 2 is Used to fetch Single Transaction Details
    var res = await PaymentDetailsProvider()
        .fetchmemberNameandPhone(memberId, tranid, '2');

    receiptsList = Receipts().parseReceipts(res['Transactions']);

    // print(receiptsList[0]);

    // singleTransaction.value = receiptsList;

    singleReceipt.value = receiptsList[0];

    // print(singleReceipt.value.aMOUNT);
    // print(singleReceipt.value.mEMBERSHIPID);
    // print(singleReceipt.value.pAYMENTTYPE);

    // print(formKey_payment.currentState);

    // print('Form Fields: ${formKey_payment.currentState!.fields.keys}');

    formKey_payment.currentState!.patchValue({
      'AMOUNT': singleReceipt.value.aMOUNT.toString(),
      'INSTALLMENT_NO': singleReceipt.value.iNSTALLMENTNO.toString()
      //   'PAYMENT_TYPE': singleReceipt.value.pAYMENTTYPE,
      //   'DESCRIPTION': singleReceipt.value.dESCRIPTION,
      //   // Add other fields as needed
    });

    // print(receiptsList[0].toJson());
    // update();

    // To update Textfields from DB Values
    if (formKey_payment.currentState != null) {
      formKey_payment.currentState!.patchValue(receiptsList[0].toJson());
    }
    // isMemberNameLoading.value = false;
  }

  // void resetForm() {
  //   print('Inside Reset Form');
  //   if (formKey_payment.currentState != null) {
  //     print('Inside Reset Form 1');
  //     // formKey_payment.currentState?.reset();

  //     print('Inside Reset Form 2');

  //     // Optionally, you can also set specific fields to initial values here if needed
  //     formKey_payment.currentState?.fields.forEach((key, field) {
  //       field.reset();
  //     });
  //   }
  // }
}
