import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vehicle_doctor_mobile/common/entities/base.dart';
import 'package:vehicle_doctor_mobile/common/entities/chat.dart';
import 'package:vehicle_doctor_mobile/common/utils/http.dart';

class ChatAPI {
  static Future<BaseResponseEntity> bindFcmtoken(
      {BindFcmTokenRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/bind_fcmtoken',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> callNotifications(
      {CallRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/send_notice',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> callToken(
      {CallTokenRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/get_rtc_token',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> sendMessage(
      {ChatRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/message',
      queryParameters: params?.toJson(),
    );
    return BaseResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> uploadImg({File? file}) async {
    String fileName = file!.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    var response = await HttpUtil().post(
      'api/upload_photo',
      data: data,
    );
    return BaseResponseEntity.fromJson(response);
  }
}
