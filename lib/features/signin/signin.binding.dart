import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/signin/signin.controller.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
      () => SigninController(),
    );
  }
}
