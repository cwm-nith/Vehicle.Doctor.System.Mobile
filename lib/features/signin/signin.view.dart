import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({super.key});

  Widget _inputField({
    TextEditingController? controller,
    String? text,
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
          ),
        ),
        inputTextEdit(
          hintText: text ?? "Name",
          controller: controller,
          isPassword: isPassword,
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
                      padding: EdgeInsets.symmetric(vertical: 58.w),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "monsterrat",
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.state.user.value.name != null
                          ? Text(controller.state.user.value.name ?? "null")
                          : Container(),
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
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              myPrint("Forgot Password");
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: AppColors.primaryElement,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "monsterrat",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don`t have an account yet? ",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "monsterrat",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goToRegister();
                          },
                          child: Text(
                            "Register here",
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
                      title: "Sign In",
                      onPressed: () async {
                        await controller.signin();
                      },
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
