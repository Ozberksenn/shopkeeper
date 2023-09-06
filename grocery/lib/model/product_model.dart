import 'package:get/get.dart';

class ProductModel {
  int? productId;
  String? productName;
  String? productImage;
  String? productCategory;
  String? productDescription;
  int? productPrice;
  var quantity = 0.obs;

  ProductModel(
      {this.productId,
      this.productName,
      this.productImage,
      this.productCategory,
      this.productDescription,
      this.productPrice,
      required this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'];
    productCategory = json['productImage'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['productCategory'] = productCategory;
    data['productDescription'] = productDescription;
    data['productPrice'] = productPrice;
    data['quantity'] = quantity;
    return data;
  }
}
