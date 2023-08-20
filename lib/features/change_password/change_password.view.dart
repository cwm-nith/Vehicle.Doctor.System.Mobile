import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/change_password/index.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  Widget _inputField({
    TextEditingController? controller,
    String? text,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? "Name",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText.withOpacity(0.9),
          ),
        ),
        inputTextEdit(
          keyboardType: keyboardType,
          hintText: text ?? "Name",
          controller: controller,
          isPassword: isPassword,
          bgColor: AppColors.primaryElement,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: transparentAppBar(
        title: SizedBox(
          width: 200.w,
          child: Text(
            "Change Password",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColors.primaryElement.withOpacity(0.3),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: EdgeInsets.all(20.w),
              width: 360.w,
              height: 780.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.w),
                  topLeft: Radius.circular(20.w),
                ),
                color: AppColors.primaryBackground,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  _inputField(
                    controller: controller.oldPasswordTextController,
                    text: "Old Password",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _inputField(
                    controller: controller.newPasswordTextController,
                    text: "Password",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  _inputField(
                    controller: controller.confirmPasswordTextController,
                    text: "Confirm Password",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btnFlatButtonWidget(
                        width: 150.w,
                        onPressed: () async {
                          await controller.changePassword();
                          myPrint("Change password");
                        },
                        title: "Change Password",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
