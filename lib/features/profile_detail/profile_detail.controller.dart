import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/user.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';
import 'package:vehicle_doctor_mobile/features/profile_detail/index.dart';

class ProfileDetailController extends GetxController {
  ProfileDetailController();
  final state = ProfileDetailState();

  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  Future updateProfile() async {
    EasyLoading.show(status: 'updating profile info...', dismissOnTap: false);
    final body = UpdateUserRq(
      phoneNumber: phoneNumberTextController.text,
      name: nameTextController.text,
    );
    await UserService.to.updateUserAsync(
      state.user.value.id,
      body,
    );
    EasyLoading.dismiss();
  }

  @override
  void onReady() {
    super.onReady();
    state.user.value = UserStore.to.profile;
    nameTextController.text = state.user.value.name ?? "";
    phoneNumberTextController.text = state.user.value.phoneNumber ?? "";
  }
}
