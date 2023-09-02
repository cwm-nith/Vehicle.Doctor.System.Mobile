import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/features/garage_main_page/index.dart';

class GarageMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GarageMainController>(
      () => GarageMainController(),
    );

    Get.lazyPut<GarageService>(
      () => GarageService(),
    );
  }
}
