import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';
import 'package:vehicle_doctor_mobile/common/values/values.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';
import 'package:vehicle_doctor_mobile/features/create_garage/index.dart';

class CreateGaragePage extends GetView<CreateGarageController> {
  const CreateGaragePage({super.key});

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController mapController =
  //       await controller.mapController.future;
  //   await mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(controller.kLake),
  //   );
  // }

  Widget _buildListViewContact(
    List<String> list, {
    required void Function(int index, String value) onTap,
  }) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisExtent: 40,
        mainAxisSpacing: 5,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 1.h,
                  left: 5.w,
                  right: 5.w,
                ),
                width: MediaQuery.of(context).size.width * 0.35,
                child: Text(
                  list[index],
                  style: TextStyle(
                    color: AppColors.secondaryElement,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTap(
                      index,
                      list[index],
                    );
                  },
                  child: Icon(
                    Icons.highlight_remove_sharp,
                    color: AppColors.secondaryElement,
                    size: 20.w,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _inputField({
    TextEditingController? textEditingController,
    String? text,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool isTextArea = false,
    Widget? icon,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          return (item.value?.dialCode
                                      .toLowerCase()
                                      .contains(searchVal.toLowerCase()) ??
                                  false) ||
                              (item.value?.name.contains(searchVal) ?? false) ||
                              (item.value?.code
                                      .toLowerCase()
                                      .contains(searchVal.toLowerCase()) ??
                                  false);
                        },
                      ),
                    )
                  : Container(),
            ],
            Expanded(
              child: isTextArea
                  ? inputTextAreaEdit(
                      keyboardType: keyboardType,
                      hintText: text ?? "Name",
                      controller: textEditingController,
                      isPassword: isPassword,
                      bgColor: AppColors.primaryElement,
                    )
                  : inputTextEdit(
                      keyboardType: keyboardType,
                      hintText: text ?? "Name",
                      controller: textEditingController,
                      isPassword: isPassword,
                      bgColor: AppColors.primaryElement,
                    ),
            ),
            ...[
              icon ?? Container(),
            ]
          ],
        ),
      ],
    );
  }

  Widget _buildGarageProfileSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0.h,
        horizontal: 20.w,
      ),
      child: Column(
        children: [
          Text(
            "Garage Profile",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(
            color: AppColors.primaryElement.withOpacity(0.6),
            height: 50.h,
            thickness: 1,
          ),
          _inputField(
            textEditingController: controller.nameTextController,
          ),
          SizedBox(
            height: 15.h,
          ),
          _inputField(
            text: "Address",
            textEditingController: controller.addressTextController,
          ),
          SizedBox(
            height: 15.h,
          ),
          _inputField(
            isTextArea: true,
            text: "Description",
            textEditingController: controller.descriptionTextController,
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  List<PopupMenuItem> _buildMapThemeList() {
    List<PopupMenuItem> items = [];
    for (var element in MapThemeType.values) {
      var firstCharactor = element.name[0].toUpperCase();
      var name = "$firstCharactor${element.name.substring(1)}";
      items.add(
        PopupMenuItem(
          onTap: () {
            controller.changeMapTheme(element);
          },
          child: Text(
            name,
            style: const TextStyle(
              color: AppColors.primaryText,
            ),
          ),
        ),
      );
    }
    return items;
  }

  Widget _buildMapSection(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: Column(
          children: [
            Container(
              color: AppColors.fourElementText,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text(
                        "Garage Location",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryElement,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.h),
                    width: MediaQuery.of(context).size.width * 0.1,
                    // child: GestureDetector(
                    //   onTap: () => Get.toNamed(AppRoutes.searchLocation),
                    //   child: Icon(
                    //     Icons.search_rounded,
                    //     size: 30.w,
                    //     color: AppColors.secondaryElement,
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: PopupMenuButton(
                      color: AppColors.primaryElement,
                      icon: Icon(
                        size: 30.w,
                        Icons.more_vert_rounded,
                        color: AppColors.secondaryElement,
                      ),
                      padding: EdgeInsets.all(0.h),
                      tooltip: "Change your map theme",
                      itemBuilder: (BuildContext context) =>
                          _buildMapThemeList(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: controller.state.currentUserLocation.value,
                  zoom: 14.4746,
                ),
                onMapCreated: (mapController) =>
                    controller.onMapCreated(mapController),
                markers: {
                  Marker(
                    onTap: () {
                      myPrint('Tapped');
                    },
                    draggable: true,
                    markerId: const MarkerId('Marker'),
                    position: controller.state.currentUserLocation.value,
                    onDragEnd: (newPosition) {
                      controller.updateCurrentLocation(
                        LatLng(
                          newPosition.latitude,
                          newPosition.longitude,
                        ),
                      );
                    },
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0.h,
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Contacts",
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              color: AppColors.primaryElement.withOpacity(0.6),
              height: 50.h,
              thickness: 1,
            ),
            _inputField(
              textEditingController: controller.ctPhTextController,
              text: "Phone Number",
              isPhoneNumber: true,
              icon: GestureDetector(
                onTap: () {
                  controller.updatePhoneNumberList();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.secondaryElementText,
                    size: 30.w,
                  ),
                ),
              ),
            ),
            ...[
              controller.state.listPhoneNumbers.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 50.h,
                        child: _buildListViewContact(
                          controller.state.listPhoneNumbers,
                          onTap: (index, value) {
                            controller.updatePhoneNumberList(
                              isRemove: true,
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
            SizedBox(
              height: 15.h,
            ),
            _inputField(
              text: "Telegram",
              textEditingController: controller.ctTgTextController,
              icon: GestureDetector(
                onTap: () {
                  controller.updateTelegramsList();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.secondaryElementText,
                    size: 30.w,
                  ),
                ),
              ),
            ),
            ...[
              controller.state.listTelegrams.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 50.h,
                        child: _buildListViewContact(
                          controller.state.listTelegrams,
                          onTap: (index, value) {
                            controller.updateTelegramsList(
                              isRemove: true,
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
            SizedBox(
              height: 15.h,
            ),
            _inputField(
              text: "WhatsApp",
              textEditingController: controller.ctWaTextController,
              icon: GestureDetector(
                onTap: () {
                  controller.updateWhatsAppsList();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.secondaryElementText,
                    size: 30.w,
                  ),
                ),
              ),
            ),
            ...[
              controller.state.listWhatsApps.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 50.h,
                        child: _buildListViewContact(
                          controller.state.listWhatsApps,
                          onTap: (index, value) {
                            controller.updateWhatsAppsList(
                              isRemove: true,
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
            SizedBox(
              height: 15.h,
            ),
            _inputField(
              text: "WeChat",
              textEditingController: controller.ctWcTextController,
              icon: GestureDetector(
                onTap: () {
                  controller.updateWeChatsList();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: AppColors.secondaryElementText,
                    size: 30.w,
                  ),
                ),
              ),
            ),
            ...[
              controller.state.listWeChats.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 50.h,
                        child: _buildListViewContact(
                          controller.state.listWeChats,
                          onTap: (index, value) {
                            controller.updateWeChatsList(
                              isRemove: true,
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSteps(BuildContext context) {
    return [
      _buildGarageProfileSection(),
      SizedBox(
        height: MediaQuery.of(context).size.height * .75,
        child: _buildMapSection(context),
      ),
      _buildContactSection(context),
      Container(),
    ];
  }

  Widget _buildStepper(BuildContext context) {
    return _buildSteps(context)[controller.state.currentStep.value];
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                _buildStepper(context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      btnFlatButtonWidget(
                        width: 60.w,
                        height: 40.h,
                        isDisable: controller.isNoBackAvailable,
                        bgColor: controller.isNoBackAvailable
                            ? AppColors.primaryElement
                            : AppColors.secondaryElementText,
                        title: "Back",
                        onPressed: () {
                          if (controller.isNoBackAvailable) {
                            return;
                          }
                          controller.state.currentStep.value--;
                        },
                      ),
                      ...[
                        controller.isNoNextAvailable
                            ? btnFlatButtonWidget(
                                width: 60.w,
                                height: 40.h,
                                title: "Save",
                                onPressed: () {},
                              )
                            : btnFlatButtonWidget(
                                width: 60.w,
                                height: 40.h,
                                title: "Next",
                                onPressed: () {
                                  if (controller.state.currentStep.value <
                                      (controller.state.totalSteps.value - 1)) {
                                    controller.state.currentStep.value++;
                                  }
                                },
                              ),
                      ]
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
