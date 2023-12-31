import 'package:backoffice/pages/form/form_controller.dart';
import 'package:backoffice/pages/form/widgets/show_modal.dart';
import 'package:backoffice/pages/product/product_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsContent extends StatelessWidget {
  ProductsContent({super.key});

  final ProductContentController controller =
      Get.put(ProductContentController());
  final FormController formController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isReady.value == true
        ? ListView.builder(
            itemCount: controller.productListData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .productListData[index].productImage
                                          .toString()))),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    controller
                                        .productListData[index].productName
                                        .toString(),
                                  ),
                                  Text(
                                      " - id : ${controller.productListData[index].productId}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "\$${controller.productListData[index].productPrice} ",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  formController.headersTabBar.value = 1;
                                  showModal(controller.productListData[index]);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 14,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              );
            })
        : const Center(child: CircularProgressIndicator()));
  }
}
