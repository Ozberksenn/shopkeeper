import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';
import '../../utils/app_routes.dart';

String tokenInfo = "";

class LoginController extends GetxController {
  RxMap login = {}.obs;
  RxMap register = {}.obs;
  RxList<UserModel> userInfo = <UserModel>[].obs;

  Future<void> registerUser(requestBody) async {
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

  Future<void> loginUser(values) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse('http://localhost:3000/login'),
          headers: {}, body: values);
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        String token = jsonResponse['token'];
        tokenInfo = token;
        if (tokenInfo.isNotEmpty) {
          // init();
          List jsonData = jsonResponse['data'];
          List<UserModel> userInfoList = jsonData
              .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList();
          userInfo.value = userInfoList;
          showSuccess('Success Login :)');
          Get.toNamed(AppRoutes.home);
        }
      } else {
        showWarning('something error');
      }
    } catch (e) {
      print(e);
    }
  }

  // void init() async {
  //   var url = Uri.http('localhost:3000', '/login');
  //   try {
  //     var response =
  //         await http.get(url, headers: {'Authorization': 'Bearer $tokenInfo'});
  //     if (response.statusCode == 200) {
  //       var jsonResponse = json.decode(response.body);
  //       List jsonData = jsonResponse['data'];
  //       List<UserModel> userInfoList = jsonData
  //           .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
  //           .toList();
  //       userInfo.value = userInfoList;
  //     } else {
  //       showWarning('Status Code error');
  //     }
  //   } catch (e) {
  //     showWarning(e.toString());
  //   }
  // }
}
