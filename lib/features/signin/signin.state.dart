import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';

class SigninState {
  // final userService = SigninService.
  var user = UserEntity().obs;
  var countryCodes = Countries.list;
  Rx<Country?> countryCodeSelected = Countries.findByDialCode("+855").obs;
}
