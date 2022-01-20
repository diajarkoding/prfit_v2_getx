import 'package:get/get.dart';

import '../controllers/abs_list_controller.dart';

class AbsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsListController>(
      () => AbsListController(),
    );
  }
}
