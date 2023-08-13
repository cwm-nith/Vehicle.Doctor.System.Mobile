import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/features/profile_detail/index.dart';

class ProfileDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetailController>(
      () => ProfileDetailController(),
    );
    Get.lazyPut<UserService>(
      () => UserService(),
    );
  }
}
