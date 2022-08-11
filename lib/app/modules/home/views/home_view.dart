import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Disini Tanggalnya$index",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // Isi Postingan
                              SizedBox(
                                child: Text(
                                  "AKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboi",
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
                                        onPressed: () {
                                          Get.toNamed(Routes.KOMENTAR);
                                        },
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
            ),
            !context.isPhone
                ? Container(
                    height: double.infinity,
                    width: 300,
                    color: MyColor.secondaryBg,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Daftar Teman",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(
                            height: Get.height - 112,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 30,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg"),
                                        ),
                                        Text(
                                          "Nama Ke-$index",
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
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
        alignment: Alignment(0.9, 0.9),
        child: FloatingActionButton(
            child: Icon(FontAwesomeIcons.plus), onPressed: () {}),
      ),
    );
  }
}
