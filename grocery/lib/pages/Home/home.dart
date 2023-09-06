import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/theme/light_theme.dart';
import '../../widgets/appBar_widget.dart';
import '../../widgets/slider_widget.dart';
import 'widget/category_card_widget.dart';
import 'widget/menu_item_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: ListView(
        children: [
          slider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected by category',
                  style: lightTheme.textTheme.titleLarge,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  height: Get.height / 9,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return categoryCard(index);
                      }),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected by menu',
                style: lightTheme.textTheme.titleLarge,
              ),
              SizedBox(
                  height: Get.height / 3.8,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return menuItemCard();
                      }))
            ],
          )
        ],
      ),
    );
  }
}
