import 'package:dio/dio.dart';
import 'package:vehicle_doctor_mobile/common/constant.dart';
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';

class GoogleSearchPlaceAPI {
  static Future<GooglePlace?> getPlacesAsync(String input) async {
    final dio = Dio();
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=${Constant.mapApiKey}';
      var response = await dio.get(request);
      if (response.statusCode != 200) return null;
      return GooglePlace.fromJson(response.data);
    } catch (e) {
      myPrint(e);
      return null;
    }
  }
}
