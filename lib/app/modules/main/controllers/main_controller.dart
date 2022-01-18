import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
