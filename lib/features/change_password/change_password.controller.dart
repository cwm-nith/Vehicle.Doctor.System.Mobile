import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/routes/routes.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/change_password/index.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController();
  final state = ChangePasswordState();

  final TextEditingController oldPasswordTextController =
      TextEditingController();
  final TextEditingController newPasswordTextController =
      TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  Future changePassword() async {
    EasyLoading.show(status: 'loading...', dismissOnTap: false);

    var body = ChangePasswordRq(
      oldPassword: oldPasswordTextController.text,
      newPassword: newPasswordTextController.text,
    );
    if (body.newPassword != confirmPasswordTextController.text) {
      MyDialog.error(text: "Password did not match!");
      EasyLoading.dismiss();
      return;
    }

    var isChangePassword = await UserService.to.changePasswordAsync(body);
    if (isChangePassword) {
      EasyLoading.dismiss();
      Get.offAllNamed(AppRoutes.signIn);
    }
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    myPrint("Disposing...");
    super.onClose();
    oldPasswordTextController.dispose();
    newPasswordTextController.dispose();
    confirmPasswordTextController.dispose();
  }
}
