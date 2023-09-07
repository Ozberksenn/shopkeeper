import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/auth/login_controller.dart';

LoginController controller = Get.put(LoginController());
AppBar appBarWidget() {
  String profileUrl =
      "https://www.pngmart.com/files/21/Admin-Profile-Vector-PNG-Clipart.png";
  return AppBar(
    leading: Image.network(
      profileUrl,
    ),
    centerTitle: false,
    title: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.userInfo.isNotEmpty
                ? controller.userInfo[0].username.toString()
                : ''),
            const Text(
              'Ready to order ?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        )),
  );
}
