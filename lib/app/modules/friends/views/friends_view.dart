import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/utils/myColors.dart';
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
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(),
                                      child: SizedBox(
                                        height: Get.height - 201,
                                        child:
                                            StreamBuilder<
                                                    DocumentSnapshot<
                                                        Map<String, dynamic>>>(
                                                stream: authCon.streamFriends(),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }

                                                  var myFriends =
                                                      (snapshot.data!.data()
                                                                  as Map<String,
                                                                      dynamic>)[
                                                              'emailFriends']
                                                          as List;
                                                  return myFriends.isNotEmpty
                                                      ? ListView.builder(
                                                          itemCount:
                                                              myFriends.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return StreamBuilder<
                                                                DocumentSnapshot<
                                                                    Map<String,
                                                                        dynamic>>>(
                                                              stream: authCon
                                                                  .streamUsers(
                                                                      myFriends[
                                                                          index]),
                                                              builder: (context,
                                                                  snapshot2) {
                                                                if (snapshot
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return const Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                }
                                                                var data =
                                                                    snapshot2
                                                                        .data!
                                                                        .data();
                                                                return Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                            border:
                                                                                Border(
                                                                      bottom: BorderSide(
                                                                          width:
                                                                              1.0,
                                                                          color:
                                                                              Color(0xFF000000)),
                                                                    )),
                                                                    height: 75,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            CircleAvatar(
                                                                              radius: 30,
                                                                              backgroundColor: Colors.white,
                                                                              backgroundImage: NetworkImage(data?['photo']),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 20,
                                                                            ),
                                                                            Text(
                                                                              data?['name'],
                                                                              style: TextStyle(fontSize: 16),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerRight,
                                                                          child:
                                                                              IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Icon(
                                                                              FontAwesomeIcons.userMinus,
                                                                              color: Colors.red,
                                                                            ),
                                                                            tooltip:
                                                                                "Hapus Teman",
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        )
                                                      : Center(
                                                          child: Text(
                                                          "Tambahkan Teman Pertamamu",
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ));
                                                }),
                                      ),
                                    ),
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
