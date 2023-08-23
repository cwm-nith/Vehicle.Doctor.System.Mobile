import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';

class LandingState {
  var tabIndex = 0.obs;
  var pushNotification = false.obs;
  Rx<GaragePageResponse> garages = GaragePageResponse().obs;
  Rx<Garage> garage = Garage().obs;
}
