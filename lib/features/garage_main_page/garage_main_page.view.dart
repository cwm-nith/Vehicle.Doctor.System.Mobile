import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/routes/routes.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/garage_main_page/index.dart';

class GarageMainPage extends GetView<GarageMainController> {
  const GarageMainPage({super.key});

  Widget _buildButton({
    String? text,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: () {
        controller.goCreateGarage();
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryElement.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.add_circle_rounded,
              size: 25.0.w,
              color: AppColors.secondaryElement,
            ),
            SizedBox(
              width: 5.w,
            ),
            Center(
              child: Text(
                text ?? 'Create',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.w,
                  color: AppColors.secondaryElement,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildButton(),
      ],
    );
  }

  Widget _buildGarageContainer(BuildContext context, {Garage? garage}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                AppRoutes.garagePage,
                arguments: {
                  "id": garage?.id,
                },
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/profile-man.jpg',
                      ),
                      foregroundImage: const AssetImage(
                        'assets/images/profile-man.jpg',
                      ),
                      backgroundColor:
                          AppColors.primaryElement.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      garage?.name ?? "Garages",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.more_vert_rounded,
            size: 25.0.w,
            color: AppColors.secondaryElement,
          ),
        ],
      ),
    );
  }

  Widget _buildGarageListView() {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(top: 10.h),
        itemCount: controller.state.garages.value.totalResults ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var garage = controller.state.garages.value.items != null
              ? controller.state.garages.value.items![index]
              : null;
          return _buildGarageContainer(context, garage: garage);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: transparentAppBar(
        title: SizedBox(
          width: 150.w,
          child: Text(
            "Garages",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getGarageByUser();
        },
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                child: _buildTopSection(),
              ),
              Divider(
                height: 40.h,
                thickness: 1,
                color: AppColors.primaryElement.withOpacity(0.5),
              ),
              Text(
                "Garages you manage",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.secondaryElement,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: _buildGarageListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
