import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kupf_mobile/presentation/controller/login/forgot_password_dialog_controller.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/k_textfield.dart';
import '../../../widgets/loading.dart';
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordDialogController controller = Get.put(ForgotPasswordDialogController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Forgot Password"),
          bottom: const PreferredSize(
            preferredSize: Size(0, 50),
            child: Padding(
              padding: EdgeInsets.only(bottom: 12, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please enter your Email, Employee ID, or Phone Number.",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
          ),
        ),
        body: Obx(
              () => Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 32),
                        // Input Field for Email/Employee ID/Phone
                        LabelTextField(
                          controller: controller.emailController,
                          hintText: "Enter Email, Employee ID, or Phone Number",
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required.";
                            }
                            return null; // Validation is handled in the controller
                          },
                        ),
                        const SizedBox(height: 24),
                        // Submit Button
                        AppButtonElevated(
                          text: "Submit",
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.forgetPassword();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Loading Indicator
              if (controller.isLoading.value) const LoadingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
