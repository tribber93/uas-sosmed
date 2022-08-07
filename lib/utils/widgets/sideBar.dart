import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

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
                  height: 200,
                  width: Get.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://miro.medium.com/max/1192/1*gjIVkxipV3d1n17kNu0DLQ.jpeg"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Si onyet Narsis")
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
                                ? Icon(FontAwesomeIcons.house)
                                : Icon(LineIcons.home),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Beranda")
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(Routes.HOME);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Get.currentRoute == Routes.FRIENDS
                                ? Icon(FontAwesomeIcons.solidHeart)
                                : Icon(FontAwesomeIcons.heart),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Teman Saya")
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(Routes.FRIENDS);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Get.currentRoute == Routes.PROFILE
                                ? Icon(FontAwesomeIcons.solidUser)
                                : Icon(FontAwesomeIcons.user),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Profile")
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(Routes.PROFILE);
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