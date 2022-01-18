import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/Utils/closeKeyboard.dart';
import 'package:prfit_v2_getx/app/controllers/auth_controller.dart';
import 'package:prfit_v2_getx/app/controllers/loading_controller.dart';
import 'package:prfit_v2_getx/app/routes/app_pages.dart';
import 'package:prfit_v2_getx/app/widgets/loading_button_login.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final loadongController = Get.put(LoadingController());

    handleLogin() {
      loadongController.isLoading.toggle();

      authController.login(
          email: controller.emailController.text,
          password: controller.passwordController.text);

      closeKeyboard(context);
    }

    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text('Login'),
        centerTitle: true,
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
                hintText: 'Email'),
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
                      onPressed: () => controller.hidden.toggle(),
                      icon: Icon(
                        Icons.remove_red_eye,
                        color:
                            controller.hidden.value ? Colors.grey : Colors.blue,
                      )),
                  labelText: 'Password',
                  hintText: 'Password'),
            ),
          ),
        ],
      );
    }

    Widget loginButton() {
      return Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.RESET_PASSWORD);
              },
              child: Text('Lupa password ?'),
            ),
            loadongController.isLoading.value
                ? LoadingButtonLogin()
                : Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        handleLogin();
                      },
                      child: Text('Masuk'),
                    ),
                  ),
          ],
        ),
      );
    }

    Widget borderLine() {
      return Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'atau',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      );
    }

    Widget signupButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun ?',
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.SIGNUP);
            },
            child: Text(
              'Daftar sekarang',
            ),
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
          SizedBox(
            height: 20,
          ),
          loginButton(),
          SizedBox(
            height: 40,
          ),
          borderLine(),
          SizedBox(
            height: 20,
          ),
          signupButton()
        ],
      ),
    );
  }
}
