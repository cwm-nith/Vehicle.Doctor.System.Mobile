import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/welcome/welcome.controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(
      () => WelcomeController(),
    );
  }
}
