import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/createStatus.dart';
import 'package:uas_sosmed/utils/widgets/myFriends.dart';
import 'package:uas_sosmed/utils/widgets/myStatus.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header dan SideBar
      body: SafeArea(
        child: SliderDrawer(
          sliderCloseSize: context.isPhone ? 0 : 50,
          appBar: const SliderAppBar(
              appBarColor: Colors.white,
              title: Text("Beranda",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700))),
          slider: SideBar(),
          // Bagian Isi
          child: Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: double.infinity,
              width: context.isPhone ? Get.width : Get.width - 350,
              color: MyColor.primaryBg,
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: authCon.streamUsers(authCon.auth.currentUser!.email!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    var statusId = (snapshot.data!.data()
                        as Map<String, dynamic>)['status_id'] as List;
                    final users = snapshot.data!.data();
                    return statusId.isNotEmpty
                        ? MyStatus(
                            statusId: statusId, authCon: authCon, users: users)
                        : const Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "Buat status pertamamu atau tambahkan teman",
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                  }),
            ),
            !context.isPhone
                ? Container(
                    height: Get.height - 10,
                    width: 300,
                    color: MyColor.secondaryBg,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("Daftar Teman",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height - 120,
                            child: ListFriends(authCon: authCon),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ]),
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.9, 0.9),
        child: FloatingActionButton(
            child: const Icon(FontAwesomeIcons.plus),
            onPressed: () {
              createStatus(context: context, type: 'Create', docId: '');
            }),
      ),
    );
  }
}
