import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/store/store.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/garage/index.dart';

class GaragePage extends GetView<GarageController> {
  const GaragePage({super.key});

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Stack(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryBg,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.w),
              ),
            ),
            // child: const Center(
            //   child: Text("User Profile Image Here"),
            // ),
          ),
          // Positioned(
          //   right: 0.w,
          //   bottom: 0.h,
          //   child: Container(
          //     width: 40.w,
          //     height: 40.h,
          //     decoration: BoxDecoration(
          //       color: AppColors.secondaryElementText,
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(50.w),
          //       ),
          //     ),
          //     child: Icon(
          //       Icons.edit,
          //       size: 25.0.w,
          //       color: AppColors.primaryText.withOpacity(0.8),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildNumberProfileBlock(String text, int number) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.secondaryElement,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.secondaryElement,
          ),
        ),
      ],
    );
  }

  Widget _buildPostCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(
                      'assets/images/profile-man.jpg',
                    ),
                    foregroundImage: const AssetImage(
                      'assets/images/profile-man.jpg',
                    ),
                    backgroundColor: AppColors.primaryElement.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    controller.state.garage.value.name ?? "",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryElement.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Posted by ${UserStore.to.profile.name}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.secondaryElement.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 15.w,
              right: 20.w,
            ),
            child: ReadMoreText(
              controller.state.garage.value.description ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.secondaryElement.withOpacity(0.9),
              ),
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              trimLines: 3,
              trimMode: TrimMode.line,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Image.asset("assets/images/profile-man.jpg"),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.thumb_up,
                          color: AppColors.secondaryElementText,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "24.9K",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondaryElement.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "200",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondaryElement.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "comment",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondaryElement.withOpacity(0.9),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                height: 20.h,
                thickness: 0.5,
                color: AppColors.secondaryElement.withOpacity(0.5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: AppColors.secondaryElement.withOpacity(0.7),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Like",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondaryElement.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.comment,
                            color: AppColors.secondaryElement.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "comment",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.secondaryElement.withOpacity(0.9),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _buildPostSection(BuildContext context) {
    List<Widget> list = List.filled(20, _buildPostCard(context));
    return list;
  }

  Widget _buildPostProfileBlock(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Posts",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryElement.withOpacity(0.9),
                ),
              ),
              GestureDetector(
                child: Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.secondaryElementText.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(
                  'assets/images/profile-man.jpg',
                ),
                foregroundImage: const AssetImage(
                  'assets/images/profile-man.jpg',
                ),
                backgroundColor: AppColors.primaryElement.withOpacity(0.7),
              ),
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Say Something?",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.secondaryElement.withOpacity(0.9),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.edit_note_sharp,
                    color: AppColors.secondaryElementText,
                    size: 25.w,
                  ),
                  Text(
                    "Status",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.secondaryElement.withOpacity(0.9),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: AppColors.secondaryElementText,
                    size: 23.w,
                  ),
                  Text(
                    "Photo",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.secondaryElement.withOpacity(0.9),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        appBar: transparentAppBar(
          title: SizedBox(
            width: 150.w,
            child: Text(
              controller.state.garage.value.name ?? "",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getGarageById(controller.state.id.value);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildProfileImage(context),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildNumberProfileBlock("Posts", 10),
                            _buildNumberProfileBlock("Followers", 10),
                            _buildNumberProfileBlock("Following", 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 20.h,
                  thickness: 0.5,
                  color: AppColors.secondaryElement.withOpacity(0.5),
                ),
                _buildPostProfileBlock(context),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 20.h,
                  thickness: 0.5,
                  color: AppColors.secondaryElement.withOpacity(0.5),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: 30,
                //     itemBuilder: (context, index) => Column(
                //       children: [
                //         _buildPostCard(context),
                //         Container(
                //           margin: EdgeInsets.only(
                //             top: 15.h,
                //           ),
                //           height: 10.h,
                //           width: MediaQuery.of(context).size.width,
                //           color: AppColors.secondaryElement.withOpacity(0.1),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                ...[
                  ..._buildPostSection(context),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
