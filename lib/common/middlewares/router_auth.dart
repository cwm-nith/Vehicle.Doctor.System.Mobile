import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/common/routes/names.dart';
import 'package:vehicle_doctor_mobile/common/store/user.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.signIn ||
        route == AppRoutes.initial) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.signIn);
    }
  }
}
