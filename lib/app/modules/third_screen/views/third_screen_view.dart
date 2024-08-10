import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/third_screen_controller.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.isEmpty.value) {
          return Center(
            child: Text(
              'No Users Found',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchUsers(isRefresh: true),
          child: ListView.builder(
            itemCount: controller.users.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.users.length) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              }

              final user = controller.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  '${user.firstName} ${user.lastName}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  user.email,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                onTap: () => controller.selectUser(user),
              );
            },
          ),
        );
      }),
    );
  }
}
