import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:society/constants.dart';
import 'package:society/text_constants.dart';

class ContactsBottomSheet extends StatelessWidget {
  final int? flag;
  const ContactsBottomSheet({
    this.flag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: double.infinity, // Set the height of the bottom sheet

      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 2.0), // Add some padding
      child: Column(
        children: [
          flag == 0
              ? Container(
                  width: 200,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey),
                )
              : const SizedBox(),
          sizedBoxHeight30,
          const Text(
            "Contact Details",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const Divider(
          //   color: Colors.black87,
          //   indent: 100,
          //   endIndent: 100,
          // ),
          sizedBoxHeight10,
          listTilebottomSheet(Icons.mobile_friendly, phoneNo),

          listTilebottomSheet(Icons.mobile_friendly, phoneNo1),

          listTilebottomSheet(Icons.call, landlineNo),

          listTilebottomSheet(Icons.email, email),

          // Add some spacing
          flag == 0
              ? ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16.0),
                    // backgroundColor: Colors.red.shade600,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: const Text("Close"),
                )
              : const Text(
                  'Secure Your\'s Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }

  ListTile listTilebottomSheet(
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.green.shade900,
      ),
      title: Text(title),
    );
  }
}
