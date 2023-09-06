import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/user_model.dart';
import '../../utils/utils.dart';

class HomeController extends GetxController {
  RxList<UserModel> userInfo = <UserModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  void init() async {
    debugPrint("init oldu");

    var url = Uri.http('localhost:3000', '/me');
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjExLCJuYW1lIjoib3piZXJrc2VuIiwiaWF0IjoxNjkzOTUwMTUyLCJleHAiOjE2OTQ1NTQ5NTJ9.oaBzfjRNP1sc8ywXXiRVJkeKPCVoC2F5MaSDVjaTEQeCLhrkV8CnCkJ8eCDuu5ERVrX1WfDgRt4kLfnVzr3LCQ'
      });
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        List jsonData = jsonResponse['data'];
        List<UserModel> userInfoList = jsonData
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
        userInfo.value = userInfoList;
      } else {
        debugPrint('Status Code error');
      }
    } catch (e) {
      showWarning(e.toString());
    }
  }
}
