import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/garage/index.dart';

class GarageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GarageController>(
      () => GarageController(),
    );
  }
}
