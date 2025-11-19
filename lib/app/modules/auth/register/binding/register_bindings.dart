import 'package:get/get.dart';
import 'package:safarisooqapp/App/modules/auth/register/controllers/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
