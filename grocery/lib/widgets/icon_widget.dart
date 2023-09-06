import 'package:flutter/material.dart';

Widget iconWidget({VoidCallback? onClick, Icon? icon, double? circleIcon}) {
  return InkWell(
    onTap: () => onClick!(),
    child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(circleIcon ?? 5)),
        child: icon ??
            const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
  );
}
