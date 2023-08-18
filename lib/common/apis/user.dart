import 'package:vehicle_doctor_mobile/common/entities/user.dart';
import 'package:vehicle_doctor_mobile/common/utils/http.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
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

  static Future<UserEntity> updateProfile(
    int id, {
    UpdateUserRq? body,
  }) async {
    var response = await HttpUtil().put(
      '/api/v1/user/$id',
      data: body?.toJson(),
    );
    return UserEntity.fromJson(response);
  }

  static Future<UserEntity> registerUser(RegisterUserRq? body) async {
    var response = await HttpUtil().post(
      '/api/v1/user',
      data: body?.toJson(),
    );
    return UserEntity.fromJson(response);
  }

  static Future<bool> changePasswordAsync(ChangePasswordRq rq) async {
    var response = await HttpUtil().post(
      '/api/v1/auth/change-password',
      data: rq.toJson(),
    );
    myPrint(response.toString());
    return response["success"];
  }
}
