import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/features/account/index.dart';

class AccountController extends GetxController {
  AccountController();
  final state = AccountState();

  @override
  Future onReady() async {
    super.onReady();
    myPrint("Account Page");
    await getGaragesByUser();
  }

  Future getGaragesByUser() async {
    var rq = PaginatedQuery();
    var data = await GarageService.to.getGaragesByUser(rq);
    state.garagePages.value = data;
  }
}
