import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/features/Welcome/index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildPageHeadTitle(String title) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Monsterrat",
            fontWeight: FontWeight.bold,
            fontSize: 45.sp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SizedBox(
        width: 360.w,
        height: 780.h,
        child: _buildPageHeadTitle(controller.appTitle),
      ),
    );
  }
}
