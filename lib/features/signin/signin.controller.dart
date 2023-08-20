import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/apis/apis.dart';
import 'package:vehicle_doctor_mobile/common/routes/routes.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

class SigninController extends GetxController {
  SigninController();

  final state = SigninState();
  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  Future signin() async {
    EasyLoading.show(status: 'loading...', dismissOnTap: false);
    var phNumber = phoneNumberTextController.text;
    var firstPhNumber = int.parse(phNumber[0]);
    var dialCode = state.countryCodeSelected.value?.dialCode.substring(1);
    if (dialCode == null) {
      MyDialog.error(text: "Please select dial code!");
      EasyLoading.dismiss();
      return;
    }
    if (firstPhNumber == 0) {
      phNumber = "$dialCode${phNumber.substring(1)}";
    } else {
      phNumber = "$dialCode$phNumber";
    }
    var rq = SigninRq(
      phoneNumber: phNumber,
      password: passwordTextController.text,
    );
    var user = await UserAPI.login(params: rq);
    state.user.value = user;
    UserStore.to.saveProfile(state.user.value);
    EasyLoading.dismiss();
    Get.offAllNamed(AppRoutes.landing);
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberTextController.dispose();
    passwordTextController.dispose();
  }
}
