import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/utils/mobile/profileMobileView.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/myStatus.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
              title: Text("Profil Saya",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: SideBar(),
          // Bagian Isi
          child: SingleChildScrollView(
            child: Container(
              padding: !context.isPhone
                  ? const EdgeInsets.fromLTRB(10, 10, 60, 10)
                  : const EdgeInsets.all(10),
              height: context.isPhone ? Get.height : Get.height - 70,
              width: Get.width,
              color: MyColor.primaryBg,
              child: context.isPhone
                  ? ProfileMobileView()
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                      radius: 150,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          authCon.auth.currentUser!.photoURL!)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    authCon.auth.currentUser!.displayName!,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "NO TI NO LEP",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            child: StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: authCon.streamUsers(
                                    authCon.auth.currentUser!.email!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  var statusId = (snapshot.data!.data()
                                          as Map<String, dynamic>)['status_id']
                                      as List;
                                  final users = snapshot.data!.data();
                                  return statusId.isNotEmpty
                                      ? MyStatus(
                                          statusId: statusId,
                                          authCon: authCon,
                                          users: users)
                                      : const Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              "Buat status pertamamu",
                                              style: TextStyle(fontSize: 24),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                }),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
