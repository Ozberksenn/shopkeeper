import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/pages/form/form_menu/form_menu_view.dart';
import 'package:backoffice/pages/form/form_user/form_user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../form_products/form_products.dart';
import '../../home/home_controller.dart';

Future<dynamic> showModal(dynamic parameter) {
  HomeController controller = Get.find();
  FormController formController = Get.find();

  return Get.dialog(Dialog(
      child: Container(
    color: Colors.blueGrey,
    width: Get.width / 1.2,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formController.headersTabBar.value == 0
                    ? 'Ekle'
                    : formController.headersTabBar.value == 1
                        ? 'Düzenle'
                        : 'Sil',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: Get.width / 1.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child: controller.menuId.value == 0
                  ? FormUserView()
                  : controller.menuId.value == 1
                      ? FormProductsView()
                      : controller.menuId.value == 2
                          ? FormMenuView(parameter: parameter)
                          : Container()),
        ),
      ],
    ),
  )));
}
