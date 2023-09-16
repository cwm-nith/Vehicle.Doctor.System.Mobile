import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/apis/garage.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';

class GarageService extends GetxService {
  static GarageService get to => Get.find();

  Future<GaragePageResponse> getGaragesByUser(PaginatedQuery rq) async {
    var garages = await GarageAPI.getGaragesByUser(rq);
    return garages;
  }

  Future<Garage> getGaragesById(int rq) async {
    var garages = await GarageAPI.getGaragesById(rq);
    return garages;
  }

  Future<GaragePageResponse> createGarageAsync(CreateGarage rq) async {
    var garages = await GarageAPI.createGarageAsync(rq);
    return garages;
  }
}
