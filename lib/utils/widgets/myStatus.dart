import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class MyStatus extends StatelessWidget {
  const MyStatus({
    Key? key,
    required this.statusId,
    required this.authCon,
    required this.users,
  }) : super(key: key);

  final List statusId;
  final AuthController authCon;
  final Map<String, dynamic>? users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: statusId.length,
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: authCon.streamStatus(statusId[index]),
              builder: (context, snapshot2) {
                if (snapshot2.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                //data status
                var dataStatus = snapshot2.data!.data();
                //data user photo
                // var dataUserList = (snapshot2.data!.data()
                //         as Map<String, dynamic>)['asign_to']
                //     as List;
                return Center(
                  child: Card(
                    child: SizedBox(
                      width:
                          context.isPhone ? Get.width * 0.8 : Get.width * 0.5,
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
                                  backgroundImage:
                                      NetworkImage(users!['photo']),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      users!['name'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Isi Postingan
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              child: Text(
                                dataStatus!['status'],
                                style: const TextStyle(height: 1.5),
                              ),
                            ),
                          ),
                          // Tombol Like dan Komen
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
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
                              const Spacer(),
                              Expanded(
                                flex: 7,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.KOMENTAR);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
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
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
