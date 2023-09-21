import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../form/form_products.dart';

Future<dynamic> showModal() {
  return Get.defaultDialog(
      title: '',
      content: Container(
        width: Get.width,
        height: 600,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
        child: FormProductsView(),
      ));
}
