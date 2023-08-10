import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/routes/routes.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/features/Welcome/welcome.state.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final appTitle = "Vehicle Doctor";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    myPrint("init page welcome");
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.signIn),
    );
  }
}
