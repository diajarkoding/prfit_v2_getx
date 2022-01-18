import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController(text: '');

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
