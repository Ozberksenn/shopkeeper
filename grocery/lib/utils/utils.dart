import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSuccess(String message) {
  Get.snackbar(
    "Success".tr,
    message.tr,
    backgroundColor: Colors.green[200],
    snackPosition: SnackPosition.TOP,
  );
}

showWarning(String message) {
  Get.snackbar(
    "Warninge".tr,
    message.tr,
    backgroundColor: Colors.red[200],
    snackPosition: SnackPosition.TOP,
  );
}

showAlert(String message) {
  Get.snackbar(
    "Warninge".tr,
    message.tr,
    backgroundColor: Colors.yellow[200],
    snackPosition: SnackPosition.TOP,
  );
}
