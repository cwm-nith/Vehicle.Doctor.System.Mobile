import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/signin/index.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({super.key});

  Widget _inputField({
    TextEditingController? textEditingController,
    String? text,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool isPhoneNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? "Name",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText.withOpacity(0.8),
          ),
        ),
        Row(
          children: [
            ...[
              isPhoneNumber
                  ? Obx(
                      () => PhoneCodeDropDown<Country>(
                          items: controller.state.countryCodes
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.dialCode,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          selectedItems:
                              controller.state.countryCodeSelected.value,
                          onChanged: (val) {
                            controller.state.countryCodeSelected.value = val;
                          },
                          searchMatchFn: (item, searchVal) {
                            return (item.value?.code
                                        .toLowerCase()
                                        .contains(searchVal.toLowerCase()) ??
                                    false) ||
                                (item.value?.name.contains(searchVal) ?? false);
                          }),
                    )
                  : Container(),
            ],
            Expanded(
              child: inputTextEdit(
                keyboardType: keyboardType,
                hintText: text ?? "Name",
                controller: textEditingController,
                isPassword: isPassword,
                bgColor: AppColors.primaryElement,
              ),
            ),
          ],
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
                          color: AppColors.primaryText.withOpacity(0.8),
                        ),
                      ),
                    ),
                    _inputField(
                      textEditingController:
                          controller.phoneNumberTextController,
                      text: "Phone Number",
                      keyboardType: const TextInputType.numberWithOptions(),
                      isPhoneNumber: true,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    _inputField(
                      textEditingController: controller.passwordTextController,
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
                                color: AppColors.secondaryElementText
                                    .withOpacity(0.8),
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
                            color: AppColors.primaryText.withOpacity(0.8),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goToRegister();
                          },
                          child: Text(
                            "Register here",
                            style: TextStyle(
                              color: AppColors.secondaryElementText
                                  .withOpacity(0.8),
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
