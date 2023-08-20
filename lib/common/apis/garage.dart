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
}
