import 'package:get/get.dart';

class ProductsModel {
  int? productId;
  String? productName;
  String? productImage;
  String? productPrice;
  RxInt? productCount;
  String? productInfo;
  int? menuId;
  String? menuName;
  bool? isBasket;

  ProductsModel(
      {this.productId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productCount,
      this.productInfo,
      this.menuId,
      this.menuName,
      this.isBasket});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'] as int;
    productName = json['product_name'] as String;
    productImage = json['product_image'] as String;
    productPrice = json['product_price'] as String;
    productCount = RxInt(json['product_count'] as int);
    productInfo = json['product_info'] as String;
    menuId = json['menu_id'] as int;
    menuName = json['menu_name'] as String;
    isBasket = json['is_basket'] as bool;
  }
}
