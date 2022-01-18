import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prfit_v2_getx/Utils/closeKeyboard.dart';
import 'package:prfit_v2_getx/app/controllers/auth_controller.dart';
import 'package:prfit_v2_getx/app/controllers/loading_controller.dart';
import 'package:prfit_v2_getx/app/widgets/loading_button.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    final loadongController = Get.put(LoadingController());
    handleSignup() {
      loadongController.isLoading.toggle();
      authController.signup(
        name: controller.nameController.text,
        email: controller.emailController.text,
        password: controller.passwordController.text,
      );
      closeKeyboard(context);
    }

    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text('Signup'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      );
    }

    Widget inputSection() {
      return Column(
        children: [
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama',
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
          Obx(
            () => TextField(
              controller: controller.passwordController,
              obscureText: controller.hidden.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      controller.hidden.toggle();
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color:
                          controller.hidden.value ? Colors.grey : Colors.blue,
                    )),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    Widget signupButton() {
      return loadongController.isLoading.value
          ? LoadingButton()
          : Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  handleSignup();
                },
                child: Text('Daftar'),
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
          Obx(() => signupButton()),
          SizedBox(
            height: 10,
          ),
          loginButton()
        ],
      ),
    );
  }
}
