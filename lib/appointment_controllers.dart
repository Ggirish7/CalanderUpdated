import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApppointmentController extends GetxController {
  late TextEditingController labelController = TextEditingController();

  Rx<DateTime> startDayTime = DateTime.now().obs;
  Rx<DateTime> endDayTime = DateTime.now().add(const Duration(hours: 2)).obs;
  RxString label = "".obs;

  @override
  void dispose() {
    labelController.dispose();
    super.dispose();
  }
}
