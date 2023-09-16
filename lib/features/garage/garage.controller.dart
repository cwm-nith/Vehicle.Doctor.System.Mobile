import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/features/garage/index.dart';

class GarageController extends GetxController {
  GarageController();
  final state = GarageState();

  @override
  Future onReady() async {
    super.onReady();
    myPrint("init garge page");
    myPrint("id from parameter : ${Get.arguments['id']}");
    var id = Get.arguments['id'];
    state.id.value = id;
    await getGarageById(id);
  }

  Future getGarageById(int id) async {
    var garage = await GarageService.to.getGaragesById(id);
    state.garage.value = garage;
    myPrint(garage.toJson());
  }
}
