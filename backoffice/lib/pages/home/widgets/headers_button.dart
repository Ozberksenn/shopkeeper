import 'package:backoffice/pages/form/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../form/widgets/show_modal.dart';

Widget headersButton(
    {required int clickId,
    IconData? icon,
    required String btnName,
    Color? iconColor}) {
  FormController controller = Get.put(FormController());
  return Row(
    children: [
      IconButton(
          onPressed: () {
            if (clickId == 0) {
              controller.headersTabBar.value = 0;
            } else if (clickId == 1) {
              controller.headersTabBar.value = 1;
            } else {
              controller.headersTabBar.value = 2;
            }
            showModal(null);
          },
          icon: Icon(
            icon ?? Icons.edit_rounded,
            color: iconColor ?? Colors.blue,
          )),
      Text(btnName),
    ],
  );
}
