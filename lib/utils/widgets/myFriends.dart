import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
    required this.authCon,
  }) : super(key: key);

  final AuthController authCon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: SizedBox(
        height: Get.height - 201,
        child: ListFriends(authCon: authCon),
      ),
    );
  }
}

class ListFriends extends StatelessWidget {
  const ListFriends({
    Key? key,
    required this.authCon,
  }) : super(key: key);

  final AuthController authCon;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: authCon.streamFriends(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          var myFriends = (snapshot.data!.data()
              as Map<String, dynamic>)['emailFriends'] as List;
          return myFriends.isNotEmpty
              ? ListView.builder(
                  itemCount: myFriends.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<
                        DocumentSnapshot<Map<String, dynamic>>>(
                      stream: authCon.streamUsers(myFriends[index]),
                      builder: (context, snapshot2) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        var data = snapshot2.data!.data();
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: Color(0xFF000000)),
                            )),
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      backgroundImage:
                                          NetworkImage(data?['photo']),
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
                    );
                  },
                )
              : const Center(
                  child: Text(
                  "Tambahkan Teman Pertamamu",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ));
        });
  }
}
