import 'dart:convert';
import 'package:backoffice/model/user_model.dart';
import 'package:backoffice/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var api = "localhost:3000";
  RxList<UsersModel> userListData = <UsersModel>[].obs;
  RxBool isReady = false.obs;
  RxInt menuId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    getUsers();
  }

  Future<void> getUsers() async {
    // user tablosunda ki bilgileri çek
    isReady.value = false;
    var url = Uri.http(api, '/users');
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonData = jsonResponse['data'];
      List<UsersModel> userList =
          jsonData.map((e) => UsersModel.fromJson(e)).toList();
      userListData.value = userList;
      isReady.value = true;
    } else {
      showAlert('response : ${response.statusCode}');
    }
  }
}
