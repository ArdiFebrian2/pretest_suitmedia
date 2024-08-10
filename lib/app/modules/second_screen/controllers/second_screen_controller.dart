import 'package:get/get.dart';

class SecondScreenController extends GetxController {
  var showName = ''.obs;
  var selectedUserName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve data from arguments with null safety
    final arguments = Get.arguments as Map<String, dynamic>?;
    showName.value = arguments?['showName'] as String? ?? 'Default Name';
    selectedUserName.value =
        arguments?['userName'] as String? ?? 'Selected User Name';
  }
}
