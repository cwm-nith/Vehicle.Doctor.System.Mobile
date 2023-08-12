import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(
      () => LandingController(),
    );
  }
}
