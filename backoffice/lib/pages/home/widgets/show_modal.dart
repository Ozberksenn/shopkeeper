import 'package:backoffice/pages/form/form_menu/form_menu_view.dart';
import 'package:backoffice/pages/form/form_user/form_user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../form/form_products/form_products.dart';
import '../home_controller.dart';

Future<dynamic> showModal() {
  HomeController controller = Get.find();

  return Get.defaultDialog(
      title: '',
      content: Expanded(
        child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
            child: controller.menuId.value == 0
                ? FormUserView()
                : controller.menuId.value == 1
                    ? FormProductsView()
                    : controller.menuId.value == 2
                        ? FormMenuView()
                        : Container()),
      ));
}
