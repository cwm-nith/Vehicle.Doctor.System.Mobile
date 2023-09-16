import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';

class CreateGarageState {
  var currentStep = 0.obs;
  var totalSteps = 4.obs;
  Rx<LatLng> currentUserLocation = const LatLng(11.5583, 104.9121).obs;

  var countryCodes = Countries.list;
  var socialTypes = GarageSocialLinks.list;
  Rx<Country?> countryCodeSelected = Countries.findByDialCode("+855").obs;
  Rx<GarageSocialLinkView?> socialTypeSelected =
      GarageSocialLinks.findByType(1).obs;

  RxList<String> listPhoneNumbers = RxList<String>();
  RxList<String> listTelegrams = RxList<String>();
  RxList<String> listWhatsApps = RxList<String>();
  RxList<String> listWeChats = RxList<String>();

  RxList<GarageSocialLinkCreate> listSocialUsernameList =
      RxList<GarageSocialLinkCreate>();
}
