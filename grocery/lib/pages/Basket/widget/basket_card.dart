import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Product/product_controller.dart';
import '../../../model/products_model.dart';

// sepet içinde ki kartlar burada.
Widget basketCardWidget(ProductsModel data) {
  final ProductController controller = Get.find();
  return Obx(() => Container(
        padding: const EdgeInsets.all(8.0),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(data.productImage.toString()))),
                ),
                Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    data.productName.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.incrementCount(data);
                      },
                      icon: const Icon(Icons.add)),
                  Text(
                    "${data.productCount}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.decrementCount(data);
                      },
                      icon: const Icon(Icons.minimize)),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.handleRemoveBasketList(data);
                },
                icon: const Icon(
                  CupertinoIcons.trash,
                  color: Colors.red,
                ))
          ],
        ),
      ));
}
