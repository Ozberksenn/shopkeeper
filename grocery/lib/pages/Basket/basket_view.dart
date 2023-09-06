import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/widgets/appBar_widget.dart';

import '../Product/product_controller.dart';
import 'widget/basket_card.dart';

class BasketView extends StatelessWidget {
  BasketView({super.key});

  ProductController get controller => Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: Obx(() => ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: Get.height / 2,
                          child: ListView.builder(
                              itemCount: controller.basketList.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.basketList[index];
                                return basketCardWidget(data);
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                // controller.orderDescription.value = value;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'Açıklama Giriniz'),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          width: Get.width / 1.1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {},
                              child: const Text(
                                'Checkout',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ]),
                )
              ],
            )));
  }
}
