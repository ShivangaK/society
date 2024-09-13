import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:society/responsive/desktop_scaffold.dart';
import 'package:society/responsive/mobile_scaffold.dart';
import 'package:society/responsive/responsive_layout.dart';
import 'package:society/responsive/tablet_scaffold.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      desktopScaffold: DesktopScaffold(),
      mobileScaffold: MobileScaffold(),
      tabletScaffold: TabletScaffold(),
    );
  }
}
