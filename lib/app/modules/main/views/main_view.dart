import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/modules/bmi/views/bmi_view.dart';
import 'package:prfit_v2_getx/app/modules/home/views/home_view.dart';
import 'package:prfit_v2_getx/app/modules/tutorial/views/tutorial_view.dart';
import 'package:prfit_v2_getx/app/modules/user/views/user_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  Widget customBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.changeCurrentIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                size: 26,
                color: controller.currentIndex.value == 0
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tutorial',
              icon: Icon(
                Icons.fitness_center,
                size: 26,
                color: controller.currentIndex.value == 1
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Bmi',
              icon: Icon(
                Icons.calculate,
                size: 26,
                color: controller.currentIndex.value == 2
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Pengguna',
              icon: Icon(
                Icons.person,
                size: 26,
                color: controller.currentIndex.value == 3
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (controller.currentIndex.value) {
      case 0:
        return HomeView();

      case 1:
        return TutorialView();

      case 2:
        return BmiView();

      case 3:
        return UserView();

      default:
        return HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: customBottomNavBar(),
      body: Obx(() => body()),
    );
  }
}
