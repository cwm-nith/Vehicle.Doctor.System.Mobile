import 'package:vehicle_doctor_mobile/common/entities/user.dart';
import 'package:vehicle_doctor_mobile/common/utils/http.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

class UserAPI {
  static Future<UserEntity> login({
    SigninRq? params,
  }) async {
    var response = await HttpUtil().post(
      'api/v1/auth/login',
      data: params?.toJson(),
    );
    return UserEntity.fromJson(response);
  }

  static Future<UserEntity> getProfile() async {
    var response = await HttpUtil().post(
      'api/get_profile',
    );
    return UserEntity.fromJson(response);
  }

  static Future<UserEntity> updateProfile({
    UpdateUserRq? params,
  }) async {
    var response = await HttpUtil().post(
      'api/update_profile',
      queryParameters: params?.toJson(),
    );
    return UserEntity.fromJson(response);
  }
}
