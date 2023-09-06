import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget basketCard({
  String? count,
  Function? addProduct,
  IconData? icon,
  String? name,
  String? description,
  String? price,
  String? image,
  bool? isAdded,
}) {
  return SizedBox(
    child: Row(
      children: [
        Stack(children: [
          Container(
              margin: const EdgeInsets.all(14.0),
              width: Get.width / 4,
              height: Get.height / 8.8,
              decoration: image != null
                  ? BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(image)),
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(100))
                  : BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: isAdded != false ? Colors.green : Colors.grey),
                      borderRadius: BorderRadius.circular(100))),
        ]),
        Expanded(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 2.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ $price",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 26),
                      ),
                      Text(
                        name ?? ' ',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ),
                IconButton(onPressed: () => addProduct!(), icon: Icon(icon))
              ],
            ),
          ),
        )
      ],
    ),
  );
}
