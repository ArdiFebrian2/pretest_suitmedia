import 'package:get/get.dart';

import '../controllers/third_screen_controller.dart';

class ThirdScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThirdScreenController>(
      () => ThirdScreenController(),
    );
  }
}
