import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/category_card_controller.dart';
import '../../../theme/light_theme.dart';

Widget categoryCard(index) {
  CategoryCardController cardController = Get.put(CategoryCardController());
  return InkWell(
    onTap: () {
      cardController.categoryCard.value = index;
    },
    child: Obx(() => Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(4.0),
          width: Get.width / 4,
          decoration: BoxDecoration(
              border: cardController.categoryCard.value == index
                  ? Border.all(width: 2, color: lightTheme.colorScheme.primary)
                  : Border.all(
                      width: 1, color: lightTheme.colorScheme.onSecondary),
              color: const Color.fromARGB(255, 234, 230, 230),
              borderRadius: BorderRadius.circular(14)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Image.network(
                  'https://banner2.cleanpng.com/20180616/kea/kisspng-asado-chili-con-carne-meat-clip-art-bologna-sausage-5b24965c8a0b12.9483959115291244445654.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Meat',
                style: lightTheme.textTheme.titleMedium,
              )
            ],
          ),
        )),
  );
}
