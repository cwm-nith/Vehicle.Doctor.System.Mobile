import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';

class GarageAPI {
  static Future<GaragePageResponse> getGaragesByUser(PaginatedQuery rq) async {
    var response = await HttpUtil().get(
      'api/v1/garage/by_user',
      queryParameters: rq.toJson(),
    );
    return GaragePageResponse.fromJson(response);
  }

  static Future<Garage> getGaragesById(int id) async {
    var response = await HttpUtil().get(
      'api/v1/garage/$id',
    );
    return Garage.fromJson(response);
  }

  static Future<GaragePageResponse> createGarageAsync(CreateGarage rq) async {
    var response = await HttpUtil().post(
      'api/v1/garage',
      data: rq.toJson(),
    );
    return GaragePageResponse.fromJson(response);
  }
}
