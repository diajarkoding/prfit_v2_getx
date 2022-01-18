import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var hidden = true.obs;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
