import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/features/garage_main_page/index.dart';

class GarageMainController extends GetxController {
  GarageMainController();
  final state = GarageMainState();
  RxString title = "".obs;

  @override
  Future onReady() async {
    super.onReady();
    title.value = "Garages you manage";
    myPrint("Garage Main Page");
    await getGarageByUser();
  }

  Future getGarageByUser() async {
    var garage = await GarageService.to.getGaragesByUser(PaginatedQuery());
    state.garages.value = garage;
  }

  void goCreateGarage() {
    Get.toNamed(AppRoutes.createGarage);
  }
}
