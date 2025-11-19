import 'package:get/get.dart';

import '../controllers/verfiy_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PasswordRecoveryController>(PasswordRecoveryController());
  }
}
