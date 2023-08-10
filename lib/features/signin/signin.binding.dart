import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/register/register.controller.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
