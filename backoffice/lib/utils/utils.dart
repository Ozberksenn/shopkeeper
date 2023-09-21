import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/menu/menu_detail_content_view.dart';
import '../pages/product/products_content_view.dart';
import '../pages/home/widgets/users_content.dart';

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

menuIdControl(menuId) {
  if (menuId == 0) {
    return UsersContent();
  } else if (menuId == 1) {
    return ProductsContent();
  } else if (menuId == 2) {
    return MenuDetailContent();
  } else {
    return Container();
  }
}
