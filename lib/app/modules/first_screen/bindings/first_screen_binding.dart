import 'package:get/get.dart';

import '../controllers/first_screen_controller.dart';

class FirstScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstScreenController>(
      () => FirstScreenController(),
    );
  }
}
