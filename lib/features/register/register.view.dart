import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/values.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/register/index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});
  Widget _inputField({TextEditingController? controller, String? text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? "Name",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputTextEdit(
          hintText: text ?? "Name",
          controller: controller,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18.w),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "monsterrat",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    _inputField(
                      controller: controller.nameTextController,
                      text: "Name",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _inputField(
                      controller: controller.phoneNumberTextController,
                      text: "Phone Number",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _inputField(
                      controller: controller.passwordTextController,
                      text: "Password",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _inputField(
                      controller: controller.confirmPasswordTextController,
                      text: "Confirm Password",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "monsterrat",
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.goToSignin(),
                          child: Text(
                            "Login here",
                            style: TextStyle(
                              color: AppColors.primaryElement,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "monsterrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    btnFlatButtonWidget(
                      title: "Sign Up",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
