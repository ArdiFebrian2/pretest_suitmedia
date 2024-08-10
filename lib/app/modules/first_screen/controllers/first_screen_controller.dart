import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  // Controllers for the text fields
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  // Method to check if the palindrome text is a palindrome
  bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  @override
  void onClose() {
    // Dispose of the text controllers when the controller is closed
    nameController.dispose();
    palindromeController.dispose();
    super.onClose();
  }
}
