import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/features/register/index.dart';

class RegisterController extends GetxController {
  RegisterController();

  final state = RegisterState();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  void goToSignin() {
    Get.toNamed(AppRoutes.signIn);
  }
}
