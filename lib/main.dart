import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:society/messages.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      translations: Messages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "GRUHAKALPA",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
