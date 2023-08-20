import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/utils.dart';

class RegisterState {
  var countryCodes = Countries.list;
  Rx<Country?> countryCodeSelected = Countries.findByDialCode("+855").obs;
}
