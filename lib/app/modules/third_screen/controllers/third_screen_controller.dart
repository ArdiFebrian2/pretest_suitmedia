import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../second_screen/controllers/second_screen_controller.dart';
import '../config.dart'; // Import the config file

class ThirdScreenController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  var isEmpty = false.obs;
  var page = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      page.value = 1;
      users.clear();
    }

    isLoading.value = true;

    final response = await http.get(
      Uri.parse('$apiBaseUrl/users?page=${page.value}&per_page=10'),
      headers: {
        'Authorization': 'Bearer $apiKey'
      }, // Add the API key to the headers if required
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['data'].isEmpty) {
        isEmpty.value = true;
      } else {
        isEmpty.value = false;
        users.addAll(
            (data['data'] as List).map((user) => User.fromJson(user)).toList());
        page.value++;
      }
    } else {
      isEmpty.value = users.isEmpty;
    }

    isLoading.value = false;
  }

  void selectUser(User user) {
    // Update the SecondScreenController with the selected user's name
    Get.find<SecondScreenController>().selectedUserName.value =
        '${user.firstName} ${user.lastName}';
    Get.back(); // Go back to the previous screen
  }
}

class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
