import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Static text
            Text(
              'Welcome',
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            ),

            // Dynamic text with Obx
            Obx(() => Text(
                  controller.showName.value,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 250),

            // Dynamic placeholder for selected user name
            Center(
              child: Obx(() => Text(
                    controller.selectedUserName.value,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            const SizedBox(height: 250),

            // Button to choose a user
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/third-screen');
                },
                child: Text(
                  'Choose a User',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: const Color(0xFF2B637B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  textStyle: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
