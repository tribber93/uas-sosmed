import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/routes/app_pages.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: Get.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // judul dan gambar
            SizedBox(
              child: Column(
                children: const [
                  Text(
                    "My Lambe App",
                    style: TextStyle(fontSize: 35),
                  ),
                  Text(
                    "Mendekatkan Yang Jauh Disana",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Image(image: AssetImage("assets/images/login.png")),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            // tombol Login
            Container(
              height: Get.height * 0.3,
              width: Get.width * 0.7,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Let's Join with Us",
                    style: TextStyle(fontSize: 20),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Get.offNamed(Routes.DASHBOARD);
                    },
                    label: const Text('Sign in With Google'),
                    icon: const FaIcon(FontAwesomeIcons.google),
                    tooltip: 'Sign in Google',
                    backgroundColor: const Color.fromARGB(155, 0, 132, 255),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
