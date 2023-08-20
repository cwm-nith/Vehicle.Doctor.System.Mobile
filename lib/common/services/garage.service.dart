import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/apis/garage.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';

class GarageService extends GetxService {
  static GarageService get to => Get.find();

  Future<GaragePageResponse> getGaragesByUser(PaginatedQuery rq) async {
    var garages = await GarageAPI.getGaragesByUser(rq);
    return garages;
  }
}
