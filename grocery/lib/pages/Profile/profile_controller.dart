import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/utils/app_routes.dart';
import 'package:grocery/utils/utils.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void handleLogOut() {
    Get.toNamed(AppRoutes.login);
  }

  Future<void> handleDeleteAccount(values) async {
    // delete butonuna tıklandığında oluşacak olan işlemler.
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('http://localhost:3000/delete'),
          headers: {},
          body: values);
      if (response.statusCode == 200) {
        showSuccess('Deleted User');
        Get.toNamed(AppRoutes.login);
      } else {
        showWarning('Error');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
