import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SafeArea(
          child: inputTextEdit(hintText: "Name"),
        ),
      ),
    );
  }
}
