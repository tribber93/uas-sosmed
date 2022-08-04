import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/utils/loginWidget/desktopView.dart';
import 'package:uas_sosmed/utils/loginWidget/mobileView.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[
              Color(0xff00ffff),
              Color(0xff4be9e9),
              Color(0xff63d4d3),
              Color(0xff71bebd),
              Color(0xff79a9a8),
              Color(0xff7e9594),
              Color(0xff808080),
            ],
          ),
        ),
        child: SingleChildScrollView(
          // tampilan Mobile
          child: context.isPhone
              ? const MobileLogin()
              : // Desktop Login View
              const DesktopLoginView(),
        ),
      ),
    );
  }
}
