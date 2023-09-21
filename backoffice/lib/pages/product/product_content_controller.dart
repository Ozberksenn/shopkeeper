import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/product_model.dart';
import '../../utils/utils.dart';

class ProductContentController extends GetxController {
  RxList<ProductsModel> productListData = <ProductsModel>[].obs;
  RxBool isReady = false.obs;

  @override
  void onInit() {
    getproducts();
    super.onInit();
  }

  Future<void> getproducts() async {
    // products tablosunda ki bilgileri çek
    isReady.value = false;
    var url = Uri.http("localhost:3000", '/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List jsonData = jsonResponse['data'];
      List<ProductsModel> productList =
          jsonData.map((e) => ProductsModel.fromJson(e)).toList();
      productListData.value = productList;
      isReady.value = true;
    } else {
      showAlert('response : ${response.statusCode}');
    }
  }
}
