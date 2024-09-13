import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WhatsappMsgView extends GetView {
  const WhatsappMsgView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsappMsgView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WhatsappMsgView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
