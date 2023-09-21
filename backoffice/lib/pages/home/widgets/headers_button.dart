import 'package:flutter/material.dart';
import 'show_modal.dart';

Widget headersButton(
    {IconData? icon, required String btnName, Color? iconColor}) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            showModal();
          },
          icon: Icon(
            icon ?? Icons.edit_rounded,
            color: iconColor ?? Colors.blue,
          )),
      Text(btnName),
    ],
  );
}
