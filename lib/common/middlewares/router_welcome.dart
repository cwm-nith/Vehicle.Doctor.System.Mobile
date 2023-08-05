import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/common/store/config.dart';
import 'package:vehicle_doctor_mobile/common/store/user.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  var priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    myPrint(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.message);
    } else {
      return const RouteSettings(name: AppRoutes.signIn);
    }
  }
}
