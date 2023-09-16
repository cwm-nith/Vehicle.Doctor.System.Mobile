import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/services/services.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';
import 'package:vehicle_doctor_mobile/features/create_garage/index.dart';

class CreateGarageController extends GetxController {
  CreateGarageController();

  @override
  Future onReady() async {
    super.onReady();
    myPrint("Creage Garage init on ready");
    state.currentUserLocation.value = await getCurrentLocation();
    myPrint(
      "${state.currentUserLocation.value.latitude}:${state.currentUserLocation.value.longitude}",
    );
  }

  final state = CreateGarageState();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  // controler input for contact
  // Phone Number
  final TextEditingController ctPhTextController = TextEditingController();

  // Telegram
  final TextEditingController ctTgTextController = TextEditingController();

  // WhatsApp
  final TextEditingController ctWaTextController = TextEditingController();

  // WeChat
  final TextEditingController ctWcTextController = TextEditingController();

  // Social Username
  final TextEditingController socialUsernameTextController =
      TextEditingController();

  bool get isHasBack => state.currentStep.value >= 1;
  bool get isNoBackAvailable => state.currentStep.value == 0;

  bool get isHasNext =>
      state.currentStep.value >= 1 &&
      state.currentStep.value >= state.totalSteps.value - 1;

  bool get isNoNextAvailable =>
      state.currentStep.value >= state.totalSteps.value - 1;

  GoogleMapController? mapController;

  Future<LatLng> getCurrentLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return LatLng(location.latitude, location.longitude);
  }

  void onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    onMapCameraMove();
  }

  Future changeMapTheme(MapThemeType? type) async {
    if (mapController == null) return;
    mapController!.setMapStyle(
      await MapTheme.getTheme(type ?? MapThemeType.standard),
    );
  }

  void onMapCameraMove() {
    mapController?.moveCamera(
      CameraUpdate.newLatLng(
        LatLng(state.currentUserLocation.value.latitude,
            state.currentUserLocation.value.longitude),
      ),
    );
  }

  void updateCurrentLocation(LatLng latLng) {
    state.currentUserLocation.value = latLng;
    onMapCameraMove();
  }

  void updatePhoneNumberList({
    bool isRemove = false,
    int? index,
    String? phoneNumber,
  }) {
    if (isRemove && index != null) {
      state.listPhoneNumbers.removeAt(index);
    } else {
      if (ctPhTextController.text.isNotEmpty) {
        var phoneNumber =
            "${state.countryCodeSelected.value?.dialCode}${ctPhTextController.text}";
        state.listPhoneNumbers.add(phoneNumber);
      }
      ctPhTextController.clear();
    }
  }

  void updateTelegramsList({
    bool isRemove = false,
    int? index,
  }) {
    if (isRemove && index != null) {
      state.listTelegrams.removeAt(index);
    } else {
      if (ctTgTextController.text.isNotEmpty) {
        state.listTelegrams.add(ctTgTextController.text);
      }
      ctTgTextController.clear();
    }
  }

  void updateWhatsAppsList({
    bool isRemove = false,
    int? index,
  }) {
    if (isRemove && index != null) {
      state.listWhatsApps.removeAt(index);
    } else {
      if (ctWaTextController.text.isNotEmpty) {
        state.listWhatsApps.add(ctWaTextController.text);
      }
      ctWaTextController.clear();
    }
  }

  void updateWeChatsList({
    bool isRemove = false,
    int? index,
  }) {
    if (isRemove && index != null) {
      state.listWeChats.removeAt(index);
    } else {
      if (ctWcTextController.text.isNotEmpty) {
        state.listWeChats.add(ctWcTextController.text);
      }
      ctWcTextController.clear();
    }
  }

  void updateSocialList({
    bool isRemove = false,
    int? index,
  }) {
    if (isRemove && index != null) {
      state.listSocialUsernameList.removeAt(index);
    } else {
      if (socialUsernameTextController.text.isNotEmpty) {
        state.listSocialUsernameList.add(
          GarageSocialLinkCreate(
            socialLink: GarageSocialLinks.userNameFormat(
              baseUrl: state.socialTypeSelected.value?.baseUrl ?? "",
              type: state.socialTypeSelected.value?.socialLinkType ?? 0,
              username: socialUsernameTextController.text,
            ),
            socialLinkType: state.socialTypeSelected.value?.socialLinkType,
          ),
        );
      }

      socialUsernameTextController.clear();
    }
  }

  Future createGarageAsync() async {
    EasyLoading.show(status: 'creating garage...', dismissOnTap: false);

    var addr = addressTextController.text;
    var name = nameTextController.text;
    var des = descriptionTextController.text;
    var lat = state.currentUserLocation.value.latitude;
    var long = state.currentUserLocation.value.longitude;
    var socialLinks = state.listSocialUsernameList;
    var body = CreateGarage(
      address: addr,
      description: des,
      garageSocialLinks: socialLinks,
      lat: lat,
      long: long,
      name: name,
      phoneNumber: state.listPhoneNumbers,
      telegram: state.listTelegrams,
      weChat: state.listWeChats,
      whatsApp: state.listWhatsApps,
    );
    await GarageService.to.createGarageAsync(body);
    EasyLoading.dismiss();
    Get.back();
  }
}
