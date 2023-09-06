import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/controller/app_controller.dart';
import 'package:grocery/model/user_model.dart';
import 'package:grocery/utils/app_routes.dart';
import 'package:http/http.dart' as http;

AppController appController = Get.put(AppController());

class DatabaseServices {
  // User register
  Future<void> register(requestBody) async {
    var client = http.Client();
    try {
      if (requestBody['password'] == requestBody['passwordAgain']) {
        var response = await client.post(
            Uri.parse('http://localhost:3000/register'),
            headers: {},
            body: requestBody);
        if (response.statusCode == 201) {
          debugPrint('Kayıt Oluşturuldu ${response.body}');
          await Get.defaultDialog(
              title: 'Alert', content: const Text('kaydınız Oluşturuldu.'));
          Get.toNamed(AppRoutes.login);
        } else {
          throw Exception('Bir hata oluştu');
        }
      } else {
        debugPrint('passwordler eşleşmiyor');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> upload(values) async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('http://localhost:3000/update'),
          headers: {},
          body: values);
      if (response.statusCode == 200) {
        debugPrint('Güncellendi.');
      } else {
        debugPrint('bir şeyler ters gitti.');
      }
    } catch (e) {
      print(e);
    }
  }
}
