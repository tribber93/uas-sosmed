import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class NavLogin extends StatelessWidget {
  final authCon = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.15,
      width: Get.width,
      color: Colors.white60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Row(
          children: [
            Image.asset("assets/logo/logo.png"),
            Spacer(
              flex: 2,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: Text("Home"),
                  ),
                  FloatingActionButton.extended(
                      onPressed: () {
                        authCon.signInWithGoogle();
                      },
                      label: Text("Sign In"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
