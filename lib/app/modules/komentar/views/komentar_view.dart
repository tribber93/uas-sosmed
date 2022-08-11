import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/utils/myColors.dart';
import 'package:uas_sosmed/utils/widgets/sideBar.dart';

import '../controllers/komentar_controller.dart';

class KomentarView extends GetView<KomentarController> {
  const KomentarView({Key? key}) : super(key: key);
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
          slider: const SideBar(),
          // Bagian Isi
          child: Row(children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: context.isPhone ? Get.width : Get.width - 350,
                color: MyColor.primaryBg,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
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
                                    const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Disini Namanya ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Disini Tanggalnya",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // Isi Postingan
                              const SizedBox(
                                child: Text(
                                  "AKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboi",
                                  style: TextStyle(height: 1.5),
                                ),
                              ),
                              // Tombol Like dan Komen
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.thumb_up),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Like"),
                                        ],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //kolom komentar
                              const TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.only(left: 40, right: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  prefixIcon: Icon(FontAwesomeIcons.comment),
                                  hintText: 'Komentar',
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Card(
                        child: SizedBox(
                          height: 400,
                          width: context.isPhone
                              ? Get.width * 0.8
                              : Get.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        children: const [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(
                                                "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg"),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Disini Namanya ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      child: Text(
                                        "AKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboiAKu adaknd fow alks seorang anak yan baik dan tidak nakan[can oicnade ajiac aboi",
                                        style: TextStyle(height: 1.5),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                          const Center(
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
                                        const CircleAvatar(
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
    );
  }
}
