import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/create_garage/index.dart';

class CreateGarageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateGarageController>(
      () => CreateGarageController(),
    );
  }
}
