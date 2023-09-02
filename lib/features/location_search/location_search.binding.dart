import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/location_search/index.dart';

class LocationSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationSearchController>(
      () => LocationSearchController(),
    );
  }
}
