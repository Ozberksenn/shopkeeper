import 'package:backoffice/pages/menu/menu_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

Widget radioGroupButtons({required String name}) {
  MenuDetailController controller = Get.put(MenuDetailController());
  return Obx(
    () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6),
      child: FormBuilderRadioGroup(
          validator: FormBuilderValidators.required(),
          decoration: const InputDecoration(border: InputBorder.none),
          name: name,
          options: controller.menuDataList.map((i) {
            return FormBuilderFieldOption(
              value: i.menuId,
              child: Text(
                i.menuName.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList()),
    ),
  );
}
