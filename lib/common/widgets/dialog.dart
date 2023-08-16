import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/values.dart';

class MyDialog {
  static Future<Widget?> error({
    String? errorCode,
    String text =
        "Something weng wrong, please try again later. Sorry for your innocent.",
  }) async {
    return await Get.dialog<Widget>(
      Dialog(
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              // Image.asset(AppImage.internetConnection, height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...[
                      errorCode != null
                          ? Text(
                              "[$errorCode]",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          : const Text("")
                    ],
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                          color: AppColors.secondaryElementText,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
