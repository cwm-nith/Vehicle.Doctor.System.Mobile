import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/profile_detail/index.dart';

class ProfileDetailPage extends GetView<ProfileDetailController> {
  const ProfileDetailPage({super.key});

  Widget _buildFieldDetail(
    BuildContext context, {
    IconData? icon,
    String? label,
    String? text,
    bool editable = false,
    TextEditingController? controller,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Icon(
              icon ?? Icons.person_outlined,
              color: AppColors.secondaryElementText,
              size: 25.0.w,
            ),
          ),
          VerticalDivider(
            endIndent: 10.h,
            indent: 10.h,
            thickness: 1.w,
            color: AppColors.primaryBackground.withOpacity(0.5),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? "Name",
                  style: const TextStyle(
                    color: AppColors.primaryText,
                  ),
                ),
                ...[
                  editable
                      ? Container()
                      : SizedBox(
                          height: 5.h,
                        ),
                  editable
                      ? inputTextEdit(
                          marginTop: 0.h,
                          controller: controller,
                          bgColor: AppColors.transparent,
                          contentPadding:
                              const EdgeInsets.fromLTRB(0, 10, 20, 0),
                        )
                      : Text(
                          text ?? "",
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.3,
      ),
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryBg,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
            ),
            child: const Center(
              child: Text("User Profile Image Here"),
            ),
          ),
          Positioned(
            right: 0.w,
            bottom: 0.h,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.secondaryElementText,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.w),
                ),
              ),
              child: Icon(
                Icons.edit,
                size: 25.0.w,
                color: AppColors.primaryText.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
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
            "Profile Detail",
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
            child: Obx(
              () => Container(
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
                    _buildProfileImage(context),
                    SizedBox(
                      height: 30.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.card_membership_rounded,
                      label: "App Id",
                      text: controller.state.user.value.id.toString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.person_outlined,
                      label: "Name",
                      text: controller.state.user.value.name,
                      editable: true,
                      controller: controller.nameTextController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.phone_iphone_rounded,
                      label: "Phone Number",
                      text: controller.state.user.value.phoneNumber,
                      editable: true,
                      controller: controller.phoneNumberTextController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.verified_user,
                      label: "Username",
                      text: controller.state.user.value.username,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.date_range_rounded,
                      label: "Created At",
                      text: controller.state.user.value.createdAt != null
                          ? dateTimeFormated(
                              controller.state.user.value.createdAt!,
                            )
                          : "",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _buildFieldDetail(
                      context,
                      icon: Icons.login_outlined,
                      label: "Last Login",
                      text: controller.state.user.value.lastLogin != null
                          ? dateTimeFormated(
                              controller.state.user.value.lastLogin!,
                              formatWithTime: true,
                            )
                          : "",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        btnFlatButtonWidget(
                          onPressed: () async {
                            await controller.updateProfile();
                          },
                          title: "Save Changes",
                        ),
                      ],
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
