import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/user.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/register/index.dart';

class RegisterController extends GetxController {
  RegisterController();
  final title = "Sign Up";
  final state = RegisterState();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  void goToSignin() {
    Get.toNamed(AppRoutes.signIn);
  }

  Future registerUser() async {
    EasyLoading.show(status: 'loading...', dismissOnTap: false);
    var body = RegisterUserRq(
      name: nameTextController.text,
      password: passwordTextController.text,
      phoneNumber: phoneNumberTextController.text,
      username: usernameTextController.text,
    );

    // TODO : Have to check validation before send request to app server

    // if (body.name?.isEmpty ?? true) {
    //   MyDialog.error(text: "Name is required");
    //   return;
    // }

    if (body.password != confirmPasswordTextController.text) {
      MyDialog.error(text: "Password did not match!");
      EasyLoading.dismiss();
      return;
    }

    var user = await UserService.to.registerUserAsync(body);
    if (user.id > 0) {
      EasyLoading.dismiss();
      Get.toNamed(AppRoutes.signIn);
    }
    EasyLoading.dismiss();
  }
}
