import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/utils/loginWidget/navLoginDesktop.dart';

import '../../app/routes/app_pages.dart';

class DesktopLoginView extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          NavLogin(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100,
              vertical: 30,
            ),
            child: SizedBox(
              height: Get.height - 60 - (Get.height * 0.15),
              width: Get.width,
              child: Row(
                children: [
                  const Expanded(
                    child: Image(
                      image: AssetImage("assets/images/login.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        height: Get.height * 0.5,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ],
                            color: const Color.fromARGB(107, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "My Lambe App",
                                  style: TextStyle(fontSize: 35),
                                ),
                                Text(
                                  "Mendekatkan Yang Jauh Disana",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Let's Join with Us",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FloatingActionButton.extended(
                                  onPressed: () {
                                    authCon.signInWithGoogle();
                                  },
                                  label: const Text('Sign in With Google'),
                                  icon: const FaIcon(FontAwesomeIcons.google),
                                  tooltip: 'Sign in Google',
                                  backgroundColor:
                                      const Color.fromARGB(155, 0, 132, 255),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
