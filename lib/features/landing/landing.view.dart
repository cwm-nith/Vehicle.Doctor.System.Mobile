import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/features/landing/index.dart';

class LandingPage extends GetView<LandingController> {
  LandingPage({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
    color: AppColors.primaryText.withOpacity(0.7),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  final TextStyle selectedLabelStyle = TextStyle(
    color: AppColors.secondaryElement,
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
          color: AppColors.primaryBackground.withOpacity(0.9),
          border: Border.all(width: 0),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (index) async {
            await landingPageController.changeTabIndex(index);
          },
          currentIndex: landingPageController.state.tabIndex.value,
          backgroundColor: AppColors.transparent,
          unselectedItemColor: AppColors.primaryText.withOpacity(0.8),
          selectedItemColor: AppColors.secondaryElementText,
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
              backgroundColor: AppColors.secondaryElementText,
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
              backgroundColor: AppColors.secondaryElementText,
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
              backgroundColor: AppColors.secondaryElementText,
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
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Profile(controller: controller),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
