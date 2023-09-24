import 'dart:convert';
import 'package:backoffice/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  RxInt headersTabBar = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> postForm(requestBody, formKey, apiUrl) async {
    var client = http.Client();
    try {
      var response =
          await client.post(Uri.parse('http://localhost:3000/$apiUrl'),
              headers: {
                'Authorization': 'Bearer your_access_token_here',
                'Content-Type': 'application/json',
              },
              body: jsonEncode(requestBody));
      // isteği encode ettik.
      if (response.statusCode == 201) {
        showSuccess('Success Created');
        formKey.currentState!.reset();
      } else {
        showAlert('Status Code Error');
      }
    } catch (e) {
      showWarning(e.toString());
    }
  }

  Future<void> updateForm(requestBody, formKey, apiUrl) async {
    var client = http.Client();
    try {
      var response =
          await client.post(Uri.parse('http://localhost:3000/$apiUrl'),
              headers: {
                'Authorization': 'Bearer your_access_token_here',
                'Content-Type': 'application/json',
              },
              body: jsonEncode(requestBody));
      // isteği encode ettik.
      if (response.statusCode == 200) {
        showSuccess('Success Updated');
        formKey.currentState!.reset();
      } else {
        showAlert('Status Code Error');
      }
    } catch (e) {
      showWarning(e.toString());
    }
  }

  Future<void> deleteForm(requestBody, formKey, apiUrl) async {
    var client = http.Client();
    try {
      var response =
          await client.post(Uri.parse('http://localhost:3000/$apiUrl'),
              headers: {
                'Authorization': 'Bearer your_access_token_here',
                'Content-Type': 'application/json',
              },
              body: jsonEncode(requestBody));
      // isteği encode ettik.
      if (response.statusCode == 200) {
        showSuccess('Success Delete');
        formKey.currentState!.reset();
      } else {
        showAlert('Status Code Error');
      }
    } catch (e) {
      showWarning(e.toString());
    }
  }
}
