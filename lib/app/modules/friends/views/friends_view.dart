import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/myFriends.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
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
              title: Text("Teman",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: SideBar(),
          // Bagian Isi
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              color: MyColor.primaryBg,
              child: Padding(
                padding: context.isPhone
                    ? EdgeInsets.fromLTRB(10, 10, 10, 10)
                    : EdgeInsets.fromLTRB(10, 10, 60, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pencarian
                    TextField(
                      onChanged: (value) => authCon.searchFriends(value),
                      controller: authCon.searchFriendsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.only(left: 40, right: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        prefixIcon:
                            const Icon(FontAwesomeIcons.magnifyingGlass),
                        hintText: 'Pencarian',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        height: Get.height,
                        width:
                            context.isPhone ? Get.width * 0.9 : Get.width * 0.5,
                        child: Obx(
                          () => authCon.hasilPencarian.isEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Daftar Teman Saya",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    MyFriends(authCon: authCon),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.all(8.0),
                                  shrinkWrap: true,
                                  itemCount: authCon.hasilPencarian.length,
                                  itemBuilder: (context, index) => ListTile(
                                        onTap: (() => authCon.addFriends(authCon
                                            .hasilPencarian[index]['email'])),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image(
                                              image: NetworkImage(
                                                  authCon.hasilPencarian[index]
                                                      ['photo'])),
                                        ),
                                        title: Text(authCon
                                            .hasilPencarian[index]['name']),
                                        subtitle: Text(authCon
                                            .hasilPencarian[index]['email']),
                                        trailing: Icon(
                                            FontAwesomeIcons.personCirclePlus),
                                      )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
