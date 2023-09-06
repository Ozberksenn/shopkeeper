import 'dart:convert';
import 'package:get/get.dart';
import 'package:grocery/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../../model/products_model.dart';

class ProductController extends GetxController {
  RxList<ProductsModel> mainProductsData =
      <ProductsModel>[].obs; // product data.
  RxList<ProductsModel> basketList = <ProductsModel>[].obs;

  @override
  void onInit() {
    fetchProductData();
    super.onInit();
  }

  Future<void> fetchProductData() async {
    var url = Uri.http('localhost:3000', '/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List jsonData = jsonResponse['data'];
      List<ProductsModel> productList = jsonData
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList();
      mainProductsData.value = productList;
    } else {
      showAlert(response.statusCode.toString());
    }
  }

  void handleAdd(ProductsModel product) {
    basketList.add(product);
    product.isBasket = true;
    product.productCount = product.productCount! + 1;
  }

  void handleRemoveBasketList(ProductsModel data) {
    data.isBasket = false;
    data.productCount!.value = 0;
    basketList.remove(data);
  }

  void incrementCount(ProductsModel data) {
    data.productCount = data.productCount! + 1;
  }

  void decrementCount(ProductsModel data) {
    if (data.productCount! > 1) {
      data.productCount = data.productCount! - 1;
    } else {
      showAlert('Bu üründen spetinizde 1 adetten daha az olamaz.');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
