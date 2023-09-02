import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  bool get isHasBack => state.currentStep.value >= 1;
  bool get isNoBackAvailable => state.currentStep.value == 0;

  bool get isHasNext =>
      state.currentStep.value >= 1 &&
      state.currentStep.value >= state.totalSteps.value - 1;

  bool get isNoNextAvailable =>
      state.currentStep.value >= state.totalSteps.value - 1;

  GoogleMapController? mapController;

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(11.5583, 104.9121),
    zoom: 14.4746,
  );

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
      var phoneNumber =
          "${state.countryCodeSelected.value?.dialCode}${ctPhTextController.text}";
      state.listPhoneNumbers.add(phoneNumber);
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
      state.listTelegrams.add(ctTgTextController.text);
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
      state.listWhatsApps.add(ctWaTextController.text);
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
      state.listWeChats.add(ctWcTextController.text);
      ctWcTextController.clear();
    }
  }
}