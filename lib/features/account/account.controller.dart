import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/features/account/index.dart';

class AccountController extends GetxController {
  AccountController();
  final appTitle = "Vehicle Doctor";
  final state = AccountState();

  @override
  Future onInit() async {
    super.onInit();
    await getGaragesByUser();
  }

  Future getGaragesByUser() async {
    var rq = PaginatedQuery();
    var data = await GarageService.to.getGaragesByUser(rq);
    state.garagePages.value = data;
  }
}
