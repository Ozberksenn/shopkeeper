import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu_detail_controller.dart';

class MenuDetailContent extends StatelessWidget {
  MenuDetailContent({super.key});
  final MenuDetailController controller = Get.put(MenuDetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              child: controller.isReady.value == true
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.menuDataList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 100,
                          height: 110,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "id : ${controller.menuDataList[index].menuId}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                controller.menuDataList[index].menuName
                                    .toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      })
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}
