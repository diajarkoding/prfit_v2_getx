import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/controllers/auth_controller.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("User"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          'UserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
