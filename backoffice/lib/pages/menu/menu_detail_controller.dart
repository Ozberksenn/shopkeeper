import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/menu_model.dart';
import '../../utils/utils.dart';

class MenuDetailController extends GetxController {
  RxList<MenuModel> menuDataList = <MenuModel>[].obs;
  RxBool isReady = false.obs;

  @override
  void onInit() {
    getMenu();
    super.onInit();
  }

  Future<void> getMenu() async {
    // menu tablosunda ki bilgileri çek
    isReady.value = false;
    var url = Uri.http("localhost:3000", '/menu');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonData = jsonResponse['data'];
      List<MenuModel> menuList =
          jsonData.map((e) => MenuModel.fromJson(e)).toList();
      menuDataList.value = menuList;
      isReady.value = true;
    } else {
      showAlert('response : ${response.statusCode}');
    }
  }
}
