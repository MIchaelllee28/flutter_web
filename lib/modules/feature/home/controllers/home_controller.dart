import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_template/constants/url.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  final RxList<GlobalKey> itemKeys =
      List.generate(5, (index) => GlobalKey()).obs;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();

  RxString nameText = ''.obs;
  RxString emailText = ''.obs;
  RxString messageText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    name.addListener(() {
      nameText.value = name.text;
    });
    email.addListener(() {
      emailText.value = email.text;
    });
    message.addListener(() {
      messageText.value = message.text;
    });
  }

  Future<void> submitForm() async {
    try {
      // Validate input fields
      if (name.text.trim().isEmpty ||
          email.text.trim().isEmpty ||
          message.text.trim().isEmpty) {
        Get.snackbar(
          'Error',
          'All fields are required',
          backgroundColor: const Color(0xFFFF3333),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      // Validate email format
      if (!GetUtils.isEmail(email.text.trim())) {
        Get.snackbar(
          'Error',
          'Please enter a valid email',
          backgroundColor: const Color(0xFFFF3333),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      final url = Uri.parse('http://192.168.100.45/php-mysqli/create.php');
      print('Sending request to: $url');

      final response = await post(
        url,
        body: {
          'name': name.text.trim(),
          'email': email.text.trim(),
          'message': message.text.trim(),
        },
      ).timeout(const Duration(seconds: 10));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Form submitted successfully',
          backgroundColor: const Color(0xFF4CAF50),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        name.clear();
        email.clear();
        message.clear();
      } else {
        Get.snackbar(
          'Error',
          'Failed to submit form. Status: ${response.statusCode}, Message: ${response.body}',
          backgroundColor: const Color(0xFFFF3333),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack trace: $stackTrace');
      Get.snackbar(
        'Error',
        'Network error occurred. Please try again later.',
        backgroundColor: const Color(0xFFFF3333),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void scrollToItem(int index) {
    if (index >= 0 && index < itemKeys.length) {
      Scrollable.ensureVisible(
        itemKeys[index].currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Store hover states for multiple items
  final RxList<bool> hoverStates = List.generate(5, (index) => false).obs;

  // Method to update hover state for specific index
  void updateHoverState(int index, bool hover) {
    if (index >= 0 && index < hoverStates.length) {
      hoverStates[index] = hover;
    }
  }

  // Get hover state for specific index
  bool isHovered(int index) {
    return hoverStates[index];
  }

  //get into the url
  Future<void> urLlaunch(int index) async {
    switch (index) {
      case 0:
        await launchUrl(Uri.parse(ListUrl.portofolioIot));
        break;
      case 1:
        await launchUrl(Uri.parse(ListUrl.portofolioJava));
        break;
      case 2:
        await launchUrl(Uri.parse(ListUrl.portofolioWeb));
        break;
      default:
    }
  }
}
