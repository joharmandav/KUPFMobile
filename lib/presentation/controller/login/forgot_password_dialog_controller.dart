import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kupf_mobile/presentation/screen/sigin_view/sigin_view.dart';
import '../main/general_controller.dart';

class ForgotPasswordDialogController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isPhone = RxBool(false);
  final RxnString countryCode = RxnString();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  String determineUserType(String username) {
    if (username.startsWith('+') &&
        username.length > 10 &&
        username.length < 15) {
      return "Mobile";
    } else if (username.contains('@')) {
      return "Email";
    } else {
      return "EmployeeID";
    }
  }

  Future<void> forgetPassword() async {
    const String apiUrl = 'https://api.kupfkw.com/api/Employee/ForgetPassword';
    String username = emailController.text.trim();
    String type = determineUserType(username);

    final generalController = Get.find<GeneralController>();
    String? device = generalController.storageBox.read("device")?.toString();
    String? tenentId =
        generalController.storageBox.read('tenentId')?.toString();
    String? locationId =
        generalController.storageBox.read('locationId')?.toString();

    final Map<String, dynamic> queryParams = {
      'tenentId': tenentId,
      'locationId': locationId,
      'username': username,
      'type': type,
      'deviceId': device,
    };

    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    isLoading(true); // Start loading

    try {
      final response = await http.get(uri);

      // Log the response body for debugging
      print("Response body: ${response.body}");

      // Show the response directly in a dialog
      Get.defaultDialog(
        title: response.statusCode == 200 ? 'Success' : 'Error',
        content: Text(response.body), // Show the raw response body
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          // Navigate to the login screen
          Get.offAll(() =>
              const SignInView()); // Replace with your login screen widget
        },
      );
    } catch (e) {
      // Handle exceptions (e.g., network errors)
      print("error : ${e.toString()}");

      Get.defaultDialog(
        title: 'Error',
        content: Text('An error occurred: ${e.toString()}'),
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          // Navigate to the login screen even if there's an error
          Get.offAll(() =>
              const SignInView()); // Replace with your login screen widget
        },
      );
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
