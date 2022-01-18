import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var hidden = true.obs;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
