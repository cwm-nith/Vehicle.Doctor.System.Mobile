import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/features/change_password/index.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
    Get.lazyPut<UserService>(() => UserService());
  }
}
