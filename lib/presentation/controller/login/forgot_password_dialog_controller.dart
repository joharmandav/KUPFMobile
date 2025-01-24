import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../app/routes/routes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main/general_controller.dart';

class ForgotPasswordDialogController extends GetxController {
  RxBool isLoading = RxBool(false);
  RxBool isPhone = RxBool(false);
  final RxnString countryCode = RxnString();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void onTapEmail() {
    Get.back();
    isPhone(false);
    Get.toNamed(AppRoutes.forgot);
  }

  void onTapPhone() {
    Get.back();
    isPhone(true);
    Get.toNamed(AppRoutes.forgot);
  }
}

final generalController = Get.find<GeneralController>();

// Ensure the values are converted to Strings
String? device = generalController.storageBox.read("device")?.toString();
String? tenentId = generalController.storageBox.read('tenentId')?.toString();
String? locationId =
    generalController.storageBox.read('locationId')?.toString();

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    print('Device: $device');
    print('Tenant ID: $tenentId');
    print('Location ID: $locationId');
    // print('Location ID: $_usernameController');
    super.initState();
  }

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

  Future<void> forgetPassword(String username) async {
    const String apiUrl = 'https://api.kupfkw.com/api/Employee/ForgetPassword';
    String type = determineUserType(username);
    final Map<String, dynamic> queryParams = {
      'tenentId': tenentId,
      'locationId': locationId,
      'username': username,
      'type': type,
      'deviceId': device,
    };
    print('Location ID: $type');
    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print(response.statusCode);

        if (responseData.containsKey('message') &&
            responseData['message'] == 'Reset Password') {
          print('Please reset your password.');
        } else {
          print('Response Data: ${responseData.toString()}');
        }
      } else {
        print(
            'Error: ${response.statusCode}, Message: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter Mobile No, Email, or Employee ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => forgetPassword(_usernameController.text.trim()),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
