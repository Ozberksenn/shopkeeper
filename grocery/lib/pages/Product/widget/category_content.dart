import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/model/products_model.dart';
import 'package:grocery/pages/Product/product_controller.dart';
import 'package:grocery/utils/utils.dart';
import 'product_card.dart';

Widget categoryContent(String category) {
  final ProductController controller = Get.find();
  return Obx(() {
    List<ProductsModel> filteredProducts = controller.mainProductsData
        .where((product) => product.menuName == category)
        .toList();
    // filtredProducts kategoriler ile eşleştiri ve datadan gelen category isimleri ve menu isimlerini karşılaştırıp
    // hangi kategori hangi menüye aitse onu ayırır.
    if (filteredProducts.isEmpty) {
      return Container();
    }
    return SizedBox(
        child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              var product = filteredProducts[index];
              return Obx(() => basketCard(
                  count: product.productCount.toString(),
                  addProduct: () {
                    if (product.isBasket == false) {
                      controller.handleAdd(product);
                    } else {
                      showWarning('Bu ürün sepetinizde mevcut.');
                    }
                  },
                  icon: product.isBasket == false ? Icons.add : Icons.check,
                  image: product.productImage,
                  name: product.productName,
                  description: product.productInfo,
                  price: product.productPrice,
                  isAdded: product.isBasket));
            }));
  });
}
