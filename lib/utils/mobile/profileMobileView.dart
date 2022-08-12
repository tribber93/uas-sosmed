import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/utils/widgets/myStatus.dart';

class ProfileMobileView extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(authCon.auth.currentUser!.photoURL!)),
        const SizedBox(
          height: 10,
        ),
        Text(
          authCon.auth.currentUser!.displayName!,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "NO TI NO LEP",
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Status Saya",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
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
                              "Buat status pertamamu",
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                }),
          ),
        )
      ],
    );
  }
}
