import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class LandingPage extends GetView<LandingController> {
  LandingPage({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
    color: AppColors.primaryElementText.withOpacity(0.7),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  final TextStyle selectedLabelStyle = TextStyle(
    color: AppColors.primaryElementText,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );

  buildBottomNavigationMenu(
    BuildContext context,
    LandingController landingPageController,
  ) {
    return Obx(
      () => Container(
        height: 64.h,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 176, 106, 231),
          //     Color.fromARGB(255, 166, 112, 232),
          //     Color.fromARGB(255, 131, 123, 232),
          //     Color.fromARGB(255, 104, 132, 231),
          //   ],
          //   transform: GradientRotation(90),
          // ),
          // boxShadow: [],
          color: AppColors.secondaryElementText.withOpacity(0.9),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.state.tabIndex.value,
          backgroundColor: AppColors.transparent,
          unselectedItemColor: AppColors.primaryBackground,
          selectedItemColor: AppColors.primaryElementText,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7.w),
                child: Icon(
                  Icons.explore_rounded,
                  size: 25.0.w,
                ),
              ),
              label: 'Explore',
              backgroundColor: AppColors.primaryBg,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7.w),
                child: Icon(
                  Icons.maps_home_work_rounded,
                  size: 25.0.w,
                ),
              ),
              label: 'Places',
              backgroundColor: AppColors.primaryBg,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7.w),
                child: Icon(
                  Icons.settings,
                  size: 25.0.w,
                ),
              ),
              label: 'Profile',
              backgroundColor: AppColors.primaryBg,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        body: Obx(
          () => IndexedStack(
            index: controller.state.tabIndex.value,
            children: [
              const Text("Explorer"),
              const Text("Places"),
              Profile(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
