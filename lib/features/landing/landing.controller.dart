import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/store/user.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class LandingController extends GetxController {
  LandingController();
  final appTitle = "Explorer Page";
  final state = LandingState();

  void changeTabIndex(int index) {
    state.tabIndex.value = index;
  }

  void updatePushNotificationSetting(bool val) {
    state.pushNotification.value = val;
  }

  Future logout() async {
    await UserStore.to.onLogout();
  }
}
