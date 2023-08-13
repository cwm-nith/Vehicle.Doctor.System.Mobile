import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/apis/apis.dart';
import 'package:vehicle_doctor_mobile/common/entities/user.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  Future<UserEntity> updateUserAsync(int id, UpdateUserRq body) async {
    var updatedUser = await UserAPI.updateProfile(id, body: body);
    UserStore.to.saveProfile(updatedUser);
    return updatedUser;
  }
}
