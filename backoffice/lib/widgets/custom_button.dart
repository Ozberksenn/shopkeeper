import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customButton({String? btnName, Function? onClick}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
      child: InkWell(
        onTap: () => onClick!(),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              btnName ?? '',
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
}
