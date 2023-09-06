import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/app_routes.dart';

class LoginController extends GetxController {
  RxMap login = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> loginUser(values) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse('http://localhost:3000/login'),
          headers: {}, body: values);
      if (response.statusCode == 201) {
        Get.toNamed(AppRoutes.home);
        debugPrint(response.body); // jsonu döndürüyor.
      } else {
        debugPrint('Bir şeyler ters gitti.');
      }
    } catch (e) {
      print(e);
    }
  }
}
