import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/first_screen_controller.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  const FirstScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile.png",
                width: 116,
                height: 116,
              ),
              const SizedBox(height: 30),

              // Input untuk Nama
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.poppins(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: GoogleFonts.poppins(),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              const SizedBox(height: 20),

              // Input untuk Kalimat Palindrom
              TextField(
                controller: controller.palindromeController,
                decoration: InputDecoration(
                  labelText: 'Palindrome',
                  labelStyle: GoogleFonts.poppins(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: GoogleFonts.poppins(),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 50),

              // Tombol Cek
              ElevatedButton(
                onPressed: () {
                  final palindromeText = controller.palindromeController.text;
                  if (controller.isPalindrome(palindromeText)) {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Result', style: GoogleFonts.poppins()),
                        content: Text('The sentence is a palindrome!',
                            style: GoogleFonts.poppins()),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('OK', style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Get.dialog(
                      AlertDialog(
                        title: Text('Result', style: GoogleFonts.poppins()),
                        content: Text('The sentence is not a palindrome.',
                            style: GoogleFonts.poppins()),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('OK', style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  'CHECK',
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
              const SizedBox(height: 20),

              // Tombol Next
              ElevatedButton(
                onPressed: () {
                  // Kirim data ke layar kedua
                  Get.toNamed('/second-screen', arguments: {
                    'showName': controller.nameController.text,
                    // Pastikan untuk mengirim data yang relevan ke layar kedua
                  });
                },
                child: Text(
                  'NEXT',
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
            ],
          ),
        ),
      ),
    );
  }
}
