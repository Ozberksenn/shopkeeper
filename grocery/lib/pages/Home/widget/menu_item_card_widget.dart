import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/light_theme.dart';

Widget menuItemCard() {
  return Container(
    margin: const EdgeInsets.all(12.0),
    padding: const EdgeInsets.all(8.0),
    width: Get.width / 2.4,
    height: Get.height / 4,
    decoration: BoxDecoration(
        color: lightTheme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          'https://static.vecteezy.com/system/resources/previews/001/254/657/original/grocery-store-online-banner-template-with-phone-groceries-and-foliage-elements-vector.jpg',
          fit: BoxFit.cover,
        ),
        Text(
          'Tomhawk Steak',
          style: lightTheme.textTheme.titleLarge,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Row(
                children: [
                  Icon(
                    Icons.local_activity,
                    size: 16,
                    color: lightTheme.colorScheme.primary,
                  ),
                  Text(
                    '10.00',
                    style: lightTheme.textTheme.titleSmall,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.local_activity,
                    size: 16,
                    color: lightTheme.colorScheme.primary,
                  ),
                  Text(
                    '10-15min',
                    style: lightTheme.textTheme.titleSmall,
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
