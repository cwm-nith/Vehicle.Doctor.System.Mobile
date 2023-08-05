import 'package:vehicle_doctor_mobile/common/entities/contact.dart';
import 'package:vehicle_doctor_mobile/common/utils/http.dart';

class ContactAPI {
  static Future<ContactResponseEntity> postContact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }
}
