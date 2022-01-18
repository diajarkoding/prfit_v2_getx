import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prfit_v2_getx/Utils/closeKeyboard.dart';
import 'package:prfit_v2_getx/app/controllers/auth_controller.dart';
import 'package:prfit_v2_getx/app/controllers/loading_controller.dart';
import 'package:prfit_v2_getx/app/widgets/loading_button.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    final loadingController = Get.put(LoadingController());

    handleReset() {
      loadingController.isLoading.toggle();
      authController.resetPassword(
        controller.emailController.text,
      );
      closeKeyboard(context);
    }

    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text('Resset Password'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      );
    }

    Widget inputSection() {
      return Column(
        children: [
          TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    Widget resetButton() {
      return loadingController.isLoading.value
          ? LoadingButton()
          : Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  handleReset();
                },
                child: Text('Kirim'),
              ),
            );
    }

    Widget loginButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah punya akun ?',
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Login'),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          inputSection(),
          Obx(() => resetButton()),
          SizedBox(
            height: 10,
          ),
          loginButton()
        ],
      ),
    );
  }
}
