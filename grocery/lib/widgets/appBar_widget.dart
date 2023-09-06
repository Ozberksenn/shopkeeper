import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Home/home_controller.dart';

AppBar appBarWidget() {
  HomeController controller = Get.put(HomeController());
  String profileUrl =
      "https://www.pngmart.com/files/21/Admin-Profile-Vector-PNG-Clipart.png";
  return AppBar(
    leading: Image.network(
      profileUrl,
    ),
    centerTitle: false,
    title: Column(
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
    ),
  );
}
