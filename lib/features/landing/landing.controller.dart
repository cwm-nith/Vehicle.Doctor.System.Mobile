import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/store/user.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class LandingController extends GetxController {
  LandingController();
  final appTitle = "Explorer Page";
  final state = LandingState();

  // @override
  // Future onInit() async {
  //   super.onInit();
  //   await getGarageByUser();
  // }

  Future changeTabIndex(int index) async {
    state.tabIndex.value = index;
    // switch (index) {
    //   case 2: // profile
    //     await getGarageByUser();
    //     break;
    //   default:
    //     break;
    // }
  }

  void updatePushNotificationSetting(bool val) {
    state.pushNotification.value = val;
  }

  void goProfileDetail() {
    Get.toNamed(AppRoutes.profileDetail);
  }

  void goAccount() {
    Get.toNamed(AppRoutes.account);
  }

  void goChangeProfile() {
    Get.toNamed(AppRoutes.changePassword);
  }

  Future logout() async {
    await UserStore.to.onLogout();
  }

  Future getGarageByUser() async {
    EasyLoading.show(dismissOnTap: false);
    var garage = await GarageService.to.getGaragesByUser(PaginatedQuery());
    state.garages.value = garage;
    if (!(state.garages.value.items?.isEmpty ?? false)) {
      state.garage.value = state.garages.value.items!.first;
    } else {
      state.garage.value = Garage();
    }
    EasyLoading.dismiss();
  }
}
