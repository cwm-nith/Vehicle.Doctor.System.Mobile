import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/features/account/index.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );

    Get.lazyPut<GarageService>(
      () => GarageService(),
    );
  }
}
