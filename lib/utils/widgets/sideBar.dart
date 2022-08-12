import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class SideBar extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: Get.height),
        child: Container(
          color: Colors.blueGrey,
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              NetworkImage(authCon.auth.currentUser!.photoURL!),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          authCon.auth.currentUser!.displayName!,
                          style: const TextStyle(fontSize: 22),
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Get.currentRoute == Routes.HOME
                                ? const Icon(FontAwesomeIcons.house)
                                : const Icon(LineIcons.home),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Beranda")
                          ],
                        ),
                        onTap: () {
                          Get.offNamed(Routes.HOME);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Get.currentRoute == Routes.FRIENDS
                                ? const Icon(FontAwesomeIcons.solidHeart)
                                : const Icon(FontAwesomeIcons.heart),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Teman Saya")
                          ],
                        ),
                        onTap: () {
                          Get.offNamed(Routes.FRIENDS);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Get.currentRoute == Routes.PROFILE
                                ? const Icon(FontAwesomeIcons.solidUser)
                                : const Icon(FontAwesomeIcons.user),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Profile")
                          ],
                        ),
                        onTap: () {
                          Get.offNamed(Routes.PROFILE);
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      InkWell(
                        child: Row(
                          children: const [
                            Icon(FontAwesomeIcons.arrowRightFromBracket),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Log Out")
                          ],
                        ),
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Sign Out',
                            content: const Text('Yakin ingin keluar?'),
                            cancel: ElevatedButton(
                              onPressed: () => Get.back(),
                              child: const Text('Batal'),
                            ),
                            confirm: ElevatedButton(
                                onPressed: () => authCon.logout(),
                                child: const Text('Ya')),
                          );
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
