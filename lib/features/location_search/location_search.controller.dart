import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_doctor_mobile/features/create_garage/index.dart';

class LocationSearchController extends GetxController {
  LocationSearchController();
  final state = CreateGarageState();
  final TextEditingController nameTextController = TextEditingController();
}
