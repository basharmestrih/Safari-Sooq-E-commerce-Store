import 'package:get/get.dart';

import '../controllers/adDisplay_controller.dart';

class AddisplayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddisplayController>(
      () => AddisplayController(),
    );
  }
}
