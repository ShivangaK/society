import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:society/app/modules/payment_details/controllers/payment_details_controller.dart';
import 'package:society/constants.dart';
import 'dart:html' as html;

class ReceiptsView extends GetView<PaymentDetailsController> {
  ReceiptsView({Key? key}) : super(key: key);

  final PaymentDetailsController paymentDetailsController =
      Get.put(PaymentDetailsController());

  // final List<dynamic> _receipts = [
  //   {
  //     "ReceiptName": "Receipt 001",
  //     "ReceiptAmount": 100.50,
  //     "ReceiptDate": "2023-07-01T00:00:00Z",
  //     "pdfUrl": "https://example.com/receipt001.pdf"
  //   },
  //   {
  //     "ReceiptName": "Receipt 002",
  //     "ReceiptAmount": 250.75,
  //     "ReceiptDate": "2023-07-02T00:00:00Z",
  //     "pdfUrl": "https://example.com/receipt002.pdf"
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mobileAppBar,
      body: Obx(
        () {
          if (paymentDetailsController.receipts.isEmpty) {
            return Center(
              child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4.0),
                    // color: Colors.amber.shade100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.black,
                      ),
                      sizedBoxHeight10,
                      const Text('Fetching Receipts...')
                    ],
                  )),
            );
          }
          return ListView.builder(
            itemCount: paymentDetailsController.receipts.length,
            itemBuilder: (context, index) {
              final receipt = paymentDetailsController.receipts[index];
              // final receiptDate = DateTime.parse(receipt['ReceiptDate']);
              final receiptDate = receipt.tRANSACTIONDATE;
              final formattedDate =
                  '${receiptDate!.year}-${receiptDate.month.toString().padLeft(2, '0')}-${receiptDate.day.toString().padLeft(2, '0')}';

              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      // Colors.purple,
                      // Colors.orange
                      Colors.teal,
                      Colors.blue,
                      // // Colors.deepPurple, Colors.pink
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      6.0), // Optional: To give rounded corners
                ),
                child: ListTile(
                  leading: const Icon(Icons.receipt_long_rounded,
                      color: Colors.white),
                  title: Text(
                    receipt.dESCRIPTION.toString(),
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  dense: true,
                  trailing: Text(
                    '\u20B9 ${receipt.aMOUNT}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                  onTap: () {
                    Get.bottomSheet(Container(
                      width: Get.width - 40,
                      padding: const EdgeInsets.all(26.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Receipt Details',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () {
                              //     // print("Download button pressed");
                              //     // Get.back(); // Close the bottom sheet
                              //     html.window.open(
                              //         receipt.rECEIPT_URL.toString(), '_blank');
                              //   },
                              //   icon: const Icon(Icons.download),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Amount: \u20B9 ${receipt.aMOUNT}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Date: $formattedDate',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Receipt No.: ${receipt.dESCRIPTION}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          // const SizedBox(height: 16.0),
                          // Text(
                          //   'Transaction Type: ${receipt.tRANSACTIONTYPE}',
                          //   style: const TextStyle(fontSize: 16.0),
                          // ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Payment Mode: ${receipt.pAYMENTMODE}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Transaction Ref.: ${receipt.rEFERENCENUMBER}',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 26.0),
                          const Text(
                            'Thank you for your contributions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       Get.back(); // Close the bottom sheet
                          //       html.window.open(
                          //           receipt.rECEIPT_URL.toString(), '_blank');
                          //     },
                          //     child: const Text('View Receipt'),
                          //   ),
                          // ),
                        ],
                      ),
                    ));
                    // html.window.open(receipt.rECEIPT_URL.toString(), '_blank');
                    // _openReceipt(receipt.rECEIPT_URL)
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
