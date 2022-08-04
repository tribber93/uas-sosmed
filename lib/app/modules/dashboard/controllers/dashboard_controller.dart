import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  int tabIndex = 0;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void increment() => count.value++;
}
