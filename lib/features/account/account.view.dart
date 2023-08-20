import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/account/index.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  Widget _buildProfileSection() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: transparentAppBar(
        title: SizedBox(
          width: 200.w,
          child: Text(
            UserStore.to.profile.username ?? "",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: 360.w,
          height: 780.h,
          child: Obx(
            () => Column(
              children: [
                Text(
                  controller.state.garagePages.value.totalResults.toString(),
                  style: const TextStyle(
                    color: AppColors.primaryText,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
