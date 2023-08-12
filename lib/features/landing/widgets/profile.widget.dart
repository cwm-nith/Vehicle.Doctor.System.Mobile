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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground.withOpacity(0.8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryBg),
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: const Center(
                      child: Text("Image"),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Obx(
                    () => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${UserStore.to.profile.name}, ${UserStore.to.profile.username}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "montserrat",
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              UserStore.to.profile.phoneNumber ?? "",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: "montserrat",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "PROFILE",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryText.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  myPrint("View Profile");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outlined,
                      size: 25.0.w,
                      color: AppColors.secondaryElementText,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Details",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "View & Edit Details",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0.w),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20.0.w,
                        color: AppColors.secondaryElementText,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40.h,
                thickness: 1,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "SETTINGS",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryText.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
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
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "On",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryText.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.only(top: 8.0.w),
                        child: Switch(
                          activeColor: AppColors.secondaryElementText,
                          value: controller.state.pushNotification.value,
                          onChanged: (value) {
                            controller.updatePushNotificationSetting(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40.h,
                thickness: 1,
              ),
              Expanded(
                flex: 1,
                child: Container(),
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
    );
  }
}
