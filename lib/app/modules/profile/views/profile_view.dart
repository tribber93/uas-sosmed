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
      body: SafeArea(
        child: SliderDrawer(
          sliderCloseSize: context.isPhone ? 0 : 50,

          appBar: const SliderAppBar(
              appBarColor: Colors.white,
              title: Text("Profil Saya",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: const SideBar(),
          // Bagian Isi
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Get.height),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                width: Get.width,
                color: MyColor.primaryBg,
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nama Saya",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "NO TI NO LEP",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Status Saya",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: Get.height * 0.5,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Center(
                              child: Card(
                                child: SizedBox(
                                  width: context.isPhone
                                      ? Get.width * 0.8
                                      : Get.width * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(children: [
                                      // Bagian Yang Memposting
                                      SizedBox(
                                        height: 100,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg"),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Disini Namanya $index",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Disini Tanggalnya$index",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // Isi Postingan
                                      SizedBox(
                                        child: Text(
                                          """AKu adaknd fow alks seorang anak yan bc aboi
                                                oidoaijuhfiwefw
                                                adniaoa""",
                                          style: TextStyle(height: 1.5),
                                        ),
                                      ),
                                      // Tombol Like dan Komen
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.thumb_up),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Like"),
                                                  ],
                                                )),
                                          ),
                                          Spacer(),
                                          Expanded(
                                            flex: 7,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.chat_bubble),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Comment"),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
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
