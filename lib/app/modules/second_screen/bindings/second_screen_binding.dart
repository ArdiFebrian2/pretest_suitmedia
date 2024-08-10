import 'package:get/get.dart';

import '../controllers/second_screen_controller.dart';

class SecondScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondScreenController>(
      () => SecondScreenController(),
    );
  }
}
