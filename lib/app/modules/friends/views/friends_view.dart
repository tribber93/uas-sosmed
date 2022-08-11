import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  const FriendsView({Key? key}) : super(key: key);
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
                        width:
                            context.isPhone ? Get.width * 0.9 : Get.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Daftar Teman Saya",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(),
                              child: SizedBox(
                                height: Get.height - 201,
                                child: ListView.builder(
                                  itemCount: 20,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFF000000)),
                                        )),
                                        height: 75,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: NetworkImage(
                                                        "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg")),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Namanya",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  FontAwesomeIcons.userMinus,
                                                  color: Colors.red,
                                                ),
                                                tooltip: "Hapus Teman",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
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
