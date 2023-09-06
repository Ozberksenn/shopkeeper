import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery/pages/Product/product_controller.dart';
import 'package:grocery/widgets/appBar_widget.dart';
import 'widget/category_content.dart';
import 'widget/tab_bar_container.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Obx(
        () {
          final List distinctCategories = controller.mainProductsData
              .map((product) => product.menuName)
              .toSet()
              .toList();
          return DefaultTabController(
            length: distinctCategories.length,
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    child: TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      isScrollable: true,
                      tabs: [
                        for (String category in distinctCategories)
                          tabBarContainer(name: category),
                      ],
                    ),
                  ),
                  // ürünlerin listelendiği alan.
                  Expanded(
                    child: TabBarView(
                      children: [
                        for (String category in distinctCategories)
                          categoryContent(category),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
