import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:side_navigation/side_navigation.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  List<Widget> views = [
    SafeArea(
        child: Container(
      height: Get.height,
      width: Get.width,
      color: Colors.amber,
    )),
    Center(
      child: Text('Account'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  /// The currently selected index of the bar

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: !context.isPhone
                ? DashboardDesktop(views: views)
                : IndexedStack(
                    index: controller.tabIndex,
                    children: views,
                  ),
          ),
          bottomNavigationBar: context.isPhone
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: GNav(
                        rippleColor: Colors.grey[300]!,
                        hoverColor: Colors.grey[100]!,
                        gap: 8,
                        activeColor: Colors.blue[500],
                        iconSize: 24,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        duration: const Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey[100]!,
                        color: Colors.white60,
                        tabs: const [
                          GButton(
                            icon: FontAwesomeIcons.house,
                            text: 'Home',
                          ),
                          GButton(
                            icon: FontAwesomeIcons.solidHeart,
                            text: 'Likes',
                          ),
                          GButton(
                            icon: FontAwesomeIcons.solidUser,
                            text: 'Profile',
                          ),
                        ],
                        selectedIndex: controller.tabIndex,
                        onTabChange: controller.changeTabIndex,
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}

class DashboardDesktop extends GetView<DashboardController> {
  const DashboardDesktop({
    Key? key,
    required this.views,
  }) : super(key: key);

  final List<Widget> views;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideNavigationBar(
          theme: SideNavigationBarTheme(
              backgroundColor: Colors.black87,
              itemTheme: SideNavigationBarItemTheme(
                  selectedItemColor: Colors.blue[500]),
              togglerTheme: const SideNavigationBarTogglerTheme(
                expandIconColor: Colors.white,
                shrinkIconColor: Colors.white,
              ),
              dividerTheme: SideNavigationBarDividerTheme.standard()),
          selectedIndex: controller.tabIndex,
          header: SideNavigationBarHeader(
            image: Image.asset(
              "assets/logo/logo.png",
              height: 75,
              width: 75,
            ),
            title: const Text(
              "Yoni Tribber",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(""),
          ),
          items: const [
            SideNavigationBarItem(
              icon: FontAwesomeIcons.house,
              label: 'Beranda',
            ),
            SideNavigationBarItem(
              icon: FontAwesomeIcons.solidHeart,
              label: 'My Friends',
            ),
            SideNavigationBarItem(
              icon: FontAwesomeIcons.solidUser,
              label: 'Profile',
            ),
          ],
          onTap: controller.changeTabIndex,
        ),
        Expanded(
          child: IndexedStack(
            index: controller.tabIndex,
            children: views,
          ),
        ),
      ],
    );
  }
}
