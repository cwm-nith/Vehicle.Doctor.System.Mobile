import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/values.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class Profile extends StatelessWidget {
  final LandingController controller;
  const Profile({super.key, required this.controller});

  Widget _buildSection({
    required BuildContext context,
    required Function() onTap,
    required List<Widget> children,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 5.w,
          top: 5.h,
          bottom: 5.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryElement.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: () {
                    controller.goAccount();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 5.w,
                      top: 5.h,
                      bottom: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryBg),
                            borderRadius: BorderRadius.circular(50.w),
                          ),
                          child: const Center(
                            child: Text("Image"),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Text(
                            "${UserStore.to.profile.name}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "montserrat",
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "PROFILE",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.primaryText.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: (1 / .4),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: [
                    _buildSection(
                      context: context,
                      onTap: () {
                        controller.goProfileDetail();
                      },
                      children: [
                        Icon(
                          Icons.person_outlined,
                          size: 25.0.w,
                          color: AppColors.secondaryElementText,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Profile Details",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText.withOpacity(0.8),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "View & Edit Details",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    _buildSection(
                      context: context,
                      onTap: () {
                        controller.goChangeProfile();
                      },
                      children: [
                        Icon(
                          Icons.password_rounded,
                          size: 25.0.w,
                          color: AppColors.secondaryElementText,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    _buildSection(
                      context: context,
                      onTap: () {
                        controller.goGarageMain();
                      },
                      children: [
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset(
                            'assets/icons/garage-icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Garages",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryText.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 40.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "SETTINGS",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.primaryText.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5.w,
                    top: 5.h,
                    bottom: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      myPrint("Notification");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          size: 25.0.w,
                          color: AppColors.secondaryElementText,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Push Notifications",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText.withOpacity(0.8),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.state.pushNotification.value
                                  ? "On"
                                  : "Off",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0.w),
                          child: Switch(
                            activeColor: AppColors.secondaryElementText,
                            inactiveTrackColor:
                                AppColors.primaryText.withOpacity(0.5),
                            value: controller.state.pushNotification.value,
                            onChanged: (value) {
                              controller.updatePushNotificationSetting(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 40.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    btnFlatButtonWidget(
                      onPressed: () async {
                        await controller.logout();
                      },
                      title: "Logout",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
