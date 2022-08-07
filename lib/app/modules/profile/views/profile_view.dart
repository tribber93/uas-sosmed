import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header dan SideBar
      body: SliderDrawer(
        sliderCloseSize: 50,
        appBar: const SliderAppBar(
            appBarColor: Colors.white,
            title: Text("Profil Saya",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
        slider: const SideBar(),
        // Bagian Isi
        child: Container(
          height: double.infinity,
          width: Get.width,
          color: MyColor.primaryBg,
        ),
      ),
    );
  }
}
