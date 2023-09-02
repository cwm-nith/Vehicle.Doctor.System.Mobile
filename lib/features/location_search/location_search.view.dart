import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/values.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/location_search/index.dart';

class SearchLocationPage extends GetView<LocationSearchController> {
  const SearchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: transparentAppBar(
        title: SizedBox(
          width: 250.w,
          child: Text(
            "Search Location",
            style: TextStyle(
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          myPrint("object ====================");
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: inputTextEdit(
                        height: 40.h,
                        marginTop: 0,
                        hintText: "Search your location",
                        // controller: textEditingController,
                        bgColor: AppColors.primaryElement,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        size: 20.w,
                        color: AppColors.secondaryElement,
                      ),
                      label: const Text(
                        "My Location",
                        style: TextStyle(
                          color: AppColors.secondaryElement,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondaryElementText,
                        foregroundColor: AppColors.secondaryElementText,
                        elevation: 0,
                        fixedSize: Size(double.infinity, 40.h),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40,
                thickness: 1,
                color: AppColors.secondaryElement.withOpacity(0.1),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) => LocationListTile(
                    press: () {},
                    location: "Banasree, Dhaka, Bangladesh",
                    leading: const Icon(
                      Icons.location_pin,
                      color: AppColors.secondaryElement,
                    ),
                    textStyle: const TextStyle(
                      color: AppColors.secondaryElement,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
